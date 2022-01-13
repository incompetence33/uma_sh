#!/bin/bash
kyoukaisen(){
	if [[ -n "${TERM}" ]]; then SCREEN_WIDTH=$(tput cols); else SCREEN_WIDTH=20;fi
	LINEWORD="-"
	if [[ -n "$1" ]]; then LINEWORD="$1";fi
	printf -v _hr "%*s" ${SCREEN_WIDTH} && echo ${_hr// /${1-${LINEWORD}}}
}
skill='終わり\nスピード\nスタミナ\nパワー\n根性\n賢さ\n芝\nダート\n短距離\nマイル\n中距離\n長距離\nアオハル杯シナリオ\nUARシナリオ\nLookatCurren\n113転び114起き\nCall me KING\nDrain for rose\nFairy tale\nGⅠ苦手\nG00 1st.F∞;\nGET DOWN\nIM☆FULL☆SPEED!!\nI Never Goof Up!\nKEEP IT REAL.\nNemesis\nPresents from X\nPride of KING\nSchwarzes Schwert\nShadow Break\nU=ma2\nVIP顔パス\nYEAH☆VIVID TIME!\nintroduction：My body\n∴win Q.E.D.\nあきらめ癖\nあやしげな作戦\nありったけ\nおひとり様○\nお見通し\nかく乱\nがんばり屋\nきっとその先へ…！\nくじけぬ精神\nぐるぐるマミートリック♡\nささやき\nじゃじゃウマ娘\nどこ吹く風\nひらめき☆ランディング\nふり絞り\nほんにゃか快走祈願！\nまき直し\nまなざし\nわやかわ♪マリンダイヴ\nアオハル点火・賢\nアオハル点火・根\nアオハル点火・速\nアオハル点火・体\nアオハル点火・力\nアオハル燃焼・賢\nアオハル燃焼・根\nアオハル燃焼・速\nアオハル燃焼・体\nアオハル燃焼・力\nアガッてきた！\nアクセラレーション\nアクセルX\nアクセル全開！\nアタシもたまには、ね？\nアナタヲ・オイカケテ\nアングリング×スキーミング\nイナズマステップ\nウママニア\nウマ好み\nウマ込み冷静\nエンプレス・プライド\nカーニバルボーナス\nカッティング×DRIVE！\nキラーチューン\nキラキラ☆STARDOM\nギアシフト\nギアチェンジ\nクールダウン\nクリアハート\nグッときて♪Chu\nゲート難\nゲインヒール・スペリアー\nコーナー加速○\nコーナー回復○\nコーナー巧者○\nコンセントレーション\nコンドル猛撃波\nシックスセンス\nシューティングスター\nシンパシー\nスーパーラッキーセブン\nスタミナイーター\nスタミナキープ\nスタミナグリード\nスピードイーター\nスピードグリード\nスピードスター\nスプリントギア\nスプリントターボ\nスリーセブン\nスリップストリーム\nタイマン！デッドヒート！\nチャート急上昇！\nテンポアップ\nトリック（後）\nトリック（前）\nノンストップガール\nハヤテ一文字\nバ群嫌い\nパス上手\nピュリティオブハート\nフラワリー☆マニューバ\nブリリアント・レッドエース\nブルーローズチェイサー\nブレイズ・オブ・プライド\nプランX\nプランチャ☆ガナドール\nペースアップ\nペースキープ\nホークアイ\nポジションセンス\nマイルの支配者\nマイルコーナー○\nマイル直線○\nライトニングステップ\nラッキーセブン\nリードキープ\nリスタート\nリラックス\nレースプランナー\nレーンの魔術師\nレコメンド\nレッツ・アナボリック！\nレッドエース\nワクワクよーいドン\nワクワククライマックス\nヴィクトリーショット！\nヴィットーリアに捧ぐ舞踏\n圧倒的リード\n位置取り押し上げ\n一陣の風\n一匹狼\n引っ込み思案\n隠れ蓑\n右回り○\n雨の日○\n影打\n栄養補給\n鋭い眼光\n円弧のマエストロ\n押し切り準備\n下校の楽しみ\n下校後のスペシャリスト\n夏ウマ娘○\n火事場のバ鹿力\n禾スナハチ登ル\n外差し準備\n外枠苦手\n外枠得意○\n拡がる恐れ\n学級委員長+速さ＝バクシン\n危険回避\n奇術師\n貴顕の使命を果たすべく\n技巧派\n詰め寄り\n急ぎ足\n究極テイオーステップ\n京都レース場○\n強攻策\n曲線のソムリエ\n空回り\n薫風、永遠なる瞬間を\n恵福バルカローレ\n慧眼\n軽やかステップ\n決意の直滑降\n決死の覚悟\n見惚れるトリック\n幻惑のかく乱\n弧線のプロフェッサー\n後方待機\n後方釘付\n好位追走\n好転一息\n巧みなステップ\n紅焔ギア/LP1211-M\n鋼の意志\n豪脚\n根幹距離○\n左回り○\n差しけん制\n差しためらい\n差しのコツ○\n差しコーナー○\n差し駆け引き\n差し焦り\n差し切り体勢\n差し直線○\n砂塵慣れ\n再燃焼\n最強の名を懸けて\n坂苦手\n阪神レース場○\n策士\n札幌レース場○\n仕掛け準備\n仕掛け抜群\n姉御肌\n視界良好！異常なし！\n疾風怒濤\n手抜き癖\n秋ウマ娘○\n集中力\n十万バリキ\n春ウマ娘○\n準備万全！\n初嵐\n勝利のキッス☆\n勝利のチケットを、君にッ！\n勝利の鼓動\n勝利への執念\n小休憩\n小心者\n小倉レース場○\n昇り龍\n上昇気流\n乗り換え上手\n食いしん坊\n食い下がり\n尻尾の滝登り\n尻尾上がり\n新潟レース場○\n深呼吸\n真っ向勝負\n真打\n神業ステップ\n迅速果断\n垂れウマ回避\n勢い任せ\n晴れの日○\n精神一到\n精神一到何事か成らざらん\n聖夜のミラクルラン！\n静かな呼吸\n積極策\n切り開く者\n雪の日○\n絶対は、ボクだ\n先駆け\n先行けん制\n先行ためらい\n先行のコツ○\n先行コーナー○\n先行駆け引き\n先行焦り\n先行直線○\n先手必勝\n先陣の心得\n先頭の景色は譲らない…！\n先頭プライド\n千里眼\n潜伏態勢\n鮮明になる畏怖\n前途洋々\n前列狙い\n善後策\n全身全霊\n全力Vサインッ！\n狙うは最前列！\n早仕掛け\n束縛\n尊み☆ﾗｽﾄｽﾊﾟ—(ﾟ∀ﾟ)—ﾄ!\n対抗意識○\n大きなリード\n大井レース場○\n大局観\n脱出術\n短距離コーナー○\n短距離直線○\n地固め\n中距離コーナー○\n中距離直線○\n中京レース場○\n中山レース場○\n注目の踊り子\n長距離コーナー○\n長距離直線○\n直滑降\n直線一気\n直線加速\n直線回復\n直線巧者\n追い上げ\n追込けん制\n追込ためらい\n追込のコツ○\n追込コーナー○\n追込駆け引き\n追込焦り\n追込直線○\n徹底マーク○\n天命士\n展開窺い\n電撃の煌めき\n登山家\n努力家\n怒涛の追い上げ\n冬ウマ娘○\n東京レース場○\n逃げけん制\n逃げためらい\n逃げのコツ○\n逃げコーナー○\n逃げ駆け引き\n逃げ焦り\n逃げ直線○\n逃亡禁止令\n逃亡者\n憧れのエール\n道悪○\n独占力\n読解力\n凸凹ネイル\n曇りの日○\n内的体験\n内弁慶\n内枠苦手\n内枠得意○\n汝、皇帝の神威を見よ\n二の矢\n熱いまなざし\n熱血☆アミーゴ\n燃えろ筋肉！\n悩殺術\n波乱注意砲！\n博打うち\n白い稲妻、見せたるで！\n迫る影\n函館レース場○\n八方にらみ\n抜け駆け禁止\n抜け出し準備\n彼方、その先へ…\n非根幹距離○\n姫たるもの、勝利をこの手に\n百万バリキ\n不屈の心\n不沈艦、抜錨ォッ！\n布陣\n布石\n負けん気\n伏兵○\n福島レース場○\n別腹タンク\n変わらぬままで\n末脚\n未知への走りを見せてくれ\n魅惑のささやき\n眠れる獅子\n夢の景色へ\n夢の走り\n目くらまし\n癒えない渇き\n優等生×バクシン＝大勝利ッ\n友として、ライバルとして\n遊びはおしまいっ！\n余裕綽々\n様子見\n淀の申し子\n来てください来てください！\n来ます来てます来させます！\n良バ場○\n臨機応変\n冷静\n冷静沈着\n煌星のヴォードヴィル\n翳り退く、さざめきの矢\n'
umamusume_id='0_希望しない\n1_スペシャルウィーク\n2_サイレンススズカ\n3_トウカイテイオー\n4_マルゼンスキー\n5_オグリキャップ\n6_タイキシャトル\n7_ メジロマックイーン\n8_シンボリルドルフ\n9_ライスシャワー\n10_ゴールドシップ\n11_ウオッカ\n12_ダイワスカーレット\n13_グラスワンダー\n14_エルコンドルパサー\n15_エアグルーヴ\n16_マヤノトップガン\n17_スーパークリーク\n18_メジロライアン\n19_アグネスタキオン\n20_ウイニングチケット\n21_サクラバクシンオー\n22_ハルウララ\n23_マチカネフクキタル\n24_ナイスネイチャ\n25_キングヘイロー\n26_テイエムオペラオー\n27_ミホノブルボン\n28_ビワハヤヒデ\n29_トウカイテイオー(新衣装)\n30_メジロマック イーン(新衣装)\n31_カレンチャン\n32_ナリタタイシン\n33_スマートファルコン\n34_ナリタブライアン\n35_マヤノトップガン(花嫁/新衣装)\n36_エアグルーヴ(花嫁/新衣装)\n37_セイウンスカイ\n38_ヒシアマゾン\n39_エルコンドルパサー(新衣装)\n40_グラスワンダー(新衣装)\n41_フジキセキ\n42_ゴールドシチー\n43_水着スペシャルウィーク\n44_水着マルゼンスキー\n45_メイショウドトウ\n46_エイシンフラッシュ\n47_マチカネフクキタル(新衣装)\n48_ヒシアケボノ\n49_アグネスデジタル\n50_ライスシャワー(ハロウィン)\n51_スーパークリーク(ハロウィン)\n52_カワカミプリンセス\n53_マンハッタンカフェ\n54_シンボリルドルフ(新衣装)\n55_ゴール ドシチー(新衣装)\n56_トーセンジョーダン\n57_メジロドーベル\n58_オグリキャップ(クリスマス)\n59_ビワハヤヒデ(クリスマス)\n60_ファインモーション\n61_タマモクロス\n62_ハルウララ(新衣装)\n63_テイエムオペラオー(新衣装)'
NUM=0
rm -f umafactorlist.txt
main_uma="$(echo -ne ${umamusume_id} | fzf --reverse --header="希望代表ウマ娘")"
if [[ "${main_uma}" == *\=0_* ]]; then unset main_uma;fi
while true;do
Factor[${NUM}]="$(echo -ne ${skill}|fzf --reverse --header="因子名"|tr ' ' '+')"
if [[ ${Factor[${NUM}]} == '終わり' ]]; then ((NUM--));break;fi
Factor_Level[${NUM}]="$(echo -ne '3 代表\n2 代表\n1 代表\n1\n2\n3\n4\n5\n6\n7\n8\n9'|fzf --reverse --header="因子レベル")"
((NUM++))
done
factor_serch_word="$(for A in $(seq 0 ${NUM});do echo -ne "${Factor[${A}]}<>${Factor_Level[${A}]/\ */},";done | sed -e 's/,$//')"
SEARCH=1
LAST_ID=$(curl -s "https://asia-northeast1-walkthrough-tool.cloudfunctions.net/umamusumeFriend/search?searchFactors=${factor_serch_word}&mainUmaMusumeId=${main_uma%%_*}" -H "Accept: */*" -H "Accept-Language: ja,en-US;q=0.7,en;q=0.3" -H "Referer: https://gamewith.jp/" -H "Origin: https://gamewith.jp" -H "Connection: keep-alive" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: cross-site" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "TE: trailers" | sed 's/sort/\n/g' | tee umafactorlist.txt | tail -n1 | cut -c 4-13)
for PAGE in $(seq 200);do 
	echo -ne "リクエスト回数: ${SEARCH}\c"
	echo -ne "\r\c"
	LAST_ID=$(curl -s "https://asia-northeast1-walkthrough-tool.cloudfunctions.net/umamusumeFriend/search?searchAfter=${LAST_ID}&searchFactors=${factor_serch_word}&mainUmaMusumeId=${main_uma%%_*}" -H "Accept: */*" -H "Accept-Language: ja,en-US;q=0.7,en;q=0.3" -H "Referer: https://gamewith.jp/" -H "Origin: https://gamewith.jp" -H "Connection: keep-alive" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: cross-site" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "TE: trailers" | sed 's/sort/\n/g' | tee -a umafactorlist.txt | tail -n1 | cut -c 4-13)
	if [[ ${LAST_ID} == *"Your cli"* ]]; then break;fi
	((SEARCH++))
done
echo "リクエスト回数: ${SEARCH}"
kyoukaisen
if [[ -n ${main_uma} ]];then echo "希望代表ウマ娘:${main_uma#*_}";fi
echo "希望因子:$(for A in $(seq 0 ${NUM});do echo -ne "${Factor[${A}]}:★${Factor_Level[${A}]},";done | sed -e 's/,$//')"
echo "該当ID"
ENTRY=1
for A in $(seq $(wc -l < umafactorlist.txt));do
	IF_NUM=0
	uma="$(cat umafactorlist.txt | awk 'NR=='${A}'{print}')"
		for i in $(seq 0 ${NUM});do
			if [[ ${Factor_Level[${i}]} == *代表 ]]; then
				if [[ ! "${uma}" == *${Factor[${i}]}[0-9]\(代表["${Factor_Level[${i}]/\ */}"-3]\)* ]]; then ((IF_NUM++));fi
			else
				if [[ ! "${uma}" == *${Factor[${i}]}["${Factor_Level[${i}]}"-9]* ]]; then ((IF_NUM++));fi
			fi
		done
	if [ ${IF_NUM} == 0 ]; then echo ${uma} | tr ',' '\n' | grep trainerId | tr -d '"' | awk -F 'trainerId:' '{printf "'${ENTRY}': %s\n",$2}';((ENTRY++));fi
done
#rm -f umafactorlist.txt

