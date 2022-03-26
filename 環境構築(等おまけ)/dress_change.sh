#!/bin/bash
LANG="ja_JP.UTF-8"
trap "echo;echo 'CTRL+C が入力されたので終了します';exit 1" SIGINT
if [[ ! $(basename "$(pwd -P)") == umamusume ]]; then echo "umamusumeフォルダーで実行してくれ";echo "/mnt/c/Users/ユーザ名/AppData/LocalLow/Cygames/umamusume";echo "が一般的だと思います。";exit 1;fi
if [[ -z meta ]]; then echo "mata ファイルがあるところで実行してくれ。";echo "/mnt/c/Users/ユーザ名/AppData/LocalLow/Cygames/umamusume";echo "が一般的だと思います。";echo "もしくは一度も起動していないためにmetaファイルがないという可能性もあります。";exit 1;fi

make_character_id_list(){
	echo -ne '.mode csv\nselect * from text_data;'| sqlite3 master/master.mdb | sed 's/\r//g' | grep -E '^6,' | awk -F, 'gsub("\"","",$4){printf "s/_%s_/%s/g\n" ,$3,$4}' > character_id_list.txt
}
make_dress_id_list(){
	make_character_id_list
	echo -ne '.mode csv\nselect * from text_data;'| sqlite3 master/master.mdb | sed 's/\r//g' | grep -E '^14,' | awk -F, 'BEGIN{printf "決定\n全部\n"}gsub("\"","",$4){if($3 ~ /^[0-9]{6}/){gsub("（.*）","",$4);if($3 ~ /^1/){i=0;j=4}if($3 ~ /^9/){i=3;j=6}if($3 !~ /(^900|^2)/){printf "%s__%s_@%s\n" ,$3,substr($3,i,j),$4}}else printf "%s_%s\n" ,$3,$4}' | sed -f character_id_list.txt > dress_id_list.txt
}
make_dress_list_after_change(){
	db_restore
	echo -ne '.mode csv\nselect * from dress_data;'| sqlite3 tmp_.db | sed 's/\r//g' > dress_list_after_change.txt
}
db_restore(){
	curl -s "$(echo 'aHR0cHM6Ly9wcmQtc3RvcmFnZS11bWFtdXN1bWUuYWthbWFpemVkLm5ldC9kbC9yZXNvdXJjZXMvR2VuZXJpYy8K' | base64 -d)$(echo -ne '.dump\n' | sqlite3 meta | sed 's/\r//g' | grep 'master.mdb.lz4' | awk -F",|'" '{printf "%s/%s",substr($12,0,2),$12}')" | lz4 -dc > tmp_.db
}
db_output(){
	rm -f output_db_.txt
	echo -ne ".output output_db_.txt \n.dump" | sqlite3 master/master.mdb
}
db_rewriting(){
	make_dress_id_list
	make_dress_list_after_change
	db_output
	i=0
	while true;do
		dress_before_id[${i}]="$(grep -E "^([0-9]{6}|決定|全部)" dress_id_list.txt | fzf --reverse --header="変換希望の衣装の選択" | awk -F'_' '{print $1}')"
		if [[ ${dress_before_id[${i}]} == "決定" ]]; then break;fi
	i=$((10#${i}+1))
	done
	dress_before_id=($(echo ${dress_before_id[@]} | tr ' ' '\n' | sort -n | uniq | sed '/^決定$/d'))
	if [[ ${#dress_before_id[@]} == 0 ]]; then echo "変化させる衣装を選ばなければいけません。";exit 1;fi
	if [[ "${dress_before_id[@]}" =~ 全部 ]]; then
		dress_after_id="$(grep -E "^[0-9]{1,5}_" dress_id_list.txt | fzf --reverse --header="変換後の衣装の選択" | awk -F'_' '{print $1}')"
		dress_before_id=($(awk -F'_' '{if($1 ~ /^[0-9]{6}/ && $1 !~ /^(900|2)/){print $1}}' dress_id_list.txt))
	elif [[ ${#dress_before_id[@]} -ge 2 ]]; then
		dress_after_id="$(grep -E "^[0-9]{1,5}_" dress_id_list.txt | fzf --reverse --header="変換後の衣装の選択" | awk -F'_' '{print $1}')"
	else
		if [[ ${dress_before_id} =~ ^90 ]]; then CHARA_ID="${dress_before_id:2}";else CHARA_ID="${dress_before_id:0:4}";fi
		dress_after_id="$(grep -E "^(90${CHARA_ID}|${CHARA_ID}|[0-9]{1,5}_)" dress_id_list.txt | fzf --reverse --header="変換後の衣装の選択" | awk -F'_' '{print $1}')"
	fi
	rm -f sed_tmp.txt
	for NUM in $(seq 0 $((10#${#dress_before_id[@]}-1)));do
		echo "$(grep "INSERT INTO dress_data" output_db_.txt | grep \(${dress_before_id[${NUM}]}),$(grep "^${dress_after_id}," dress_list_after_change.txt)" | awk -F, 'BEGIN{printf "s@^.*dress_data VALUES('${dress_before_id[${NUM}]}'.*$@"}{for(i=1;i<=25;i++){data=$(i);if(i ~ /(^2$|^6$|^7$|^8$|^9$|^10$|^15$|^16$|^18$|^23$|^24$)/){data=$(i+26)} printf "%s," ,data}}END{printf "%s@\n",$26}' >> sed_tmp.txt
	done
	sed -f sed_tmp.txt output_db_.txt | tee output_db_tmp.txt > /dev/null 2>&1
	rm -f master_.mdb;echo -ne ".read output_db_tmp.txt\n.exit"|sqlite3 master_.mdb && mv master_.mdb master/master.mdb
}


while getopts "rh" OPT;do
	case $OPT in
		"r" ) db_restore;mv tmp_.db master/master.mdb;exit 0;;
		* ) echo "衣装を変更するスクリプトです。"
		echo "勝負服と私服を変更することができます。"
		echo "options"
		echo "-r:"
		echo "	master.mdbを修復します。"
		echo "-h:"
		echo "	この文章を表示します。"
		exit 0;
	esac
done
db_rewriting
rm -f character_id_list.txt dress_id_list.txt tmp_.db output_db_.txt output_db_tmp.txt dress_list_after_change.txt sed_tmp.txt
