#!/bin/bash
##これは公式サイトからウマ娘の立ち絵を取得するスクリプトです。
if [ "${1}" == "-h" ]; then echo "これは公式サイトからウマ娘の立ち絵を取得するスクリプトです。";exit 0;fi
if ! type jq>/dev/null; then sudo apt update && sudo apt install jq;fi
BASEPOINT="$(pwd -P)"
mkdir -p pictures && cd pictures
##旧バージョン
#curl 'https://umamusume.jp/app/wp-json/wp/v2/character?per_page=100' | jq | tr -d ' ' | tr -d '\n' | sed 's/templated/\n/g' | sed -e 's/prev.*$//g' >tmp.txt
#for A in $(seq $(wc -l < tmp.txt));do
#	awk 'NR=='${A}'{print}' <tmp.txt >tmp_.txt
#	sed 's/,/\n/g' tmp_.txt| sed -e 's/\[//g' -e 's/]//g' -e 's/{//g' -e 's/}//g' -e 's/"//g' -e 's/\\//g' -e 's/chara_img:/chara_img:\n/g' -e 's/<small.*>$/STARTING_FUTURE/g' >tmp__.txt
#	uma_name="$(grep title tmp__.txt| awk -F 'title:rendered:' '{printf "%s\n",$2}')"
#	grep -B 1 image <tmp__.txt > image.txt
#	B=1
#	for C in $(seq $(($(wc -l < image.txt)/2)));do
#		curl -s "$(awk -F 'image:' 'NR=='${B}+1'{printf "%s",$2}' <image.txt)" > "${uma_name}_$(awk -F ':' 'NR=='${B}'{printf "%s\n",$2}' <image.txt).png"
#		if [[ ! $? == 0 ]];then echo ${uma_name};read;fi
#		B=$((${B}+2))
#	done
#done
#rm -f tmp.txt tmp_.txt tmp__.txt image.txt
##
rm -f tmp.txt
echo "URLを取得しています……"
for A in `seq 0 10`;do
	if [ "$(curl -s "https://umamusume.jp/app/wp-json/wp/v2/character?per_page=100&offset=$((100*${A}))"|jq -rM '.[]|.title.rendered + "____" + (.acf.chara_img[]|.label + "____" + .image)'|sed -E 's@</?small>@@g'|sed -e 's/<br>/_/g'|tee -a tmp.txt|wc -l)" == "0" ]; then break;fi
done
echo "ダウンロード開始……"
MAX=$(wc -l <tmp.txt)
for A in $(seq 1 ${MAX});do
	curl -s -o "$(awk -F '____' 'NR=='${A}'{printf "%s%s.png\n",$1,$2}' tmp.txt)" "$(awk -F '____' 'NR=='${A}'{printf "%s\n",$3}' tmp.txt)"
	echo -ne "ダウンロード数: ${A}/${MAX}\c"
	echo -ne "\r\c"
done
echo "ダウンロード数: ${A}/${MAX}"
rm -f tmp.txt
cd "${BASEPOINT}"
echo -ne "完了\n画像は./picturesにあります\n"
