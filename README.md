# これからこれを使おうとしている人へ
[https://github.com/incompetence33/uma_js](https://github.com/incompetence33/uma_js)を使ったほうがおそらくいいです。

# uma.sh
このスクリプトはWindows10のwsl(ubuntu)で実行されることを想定して作られています。
それ以外の環境では動作を確認していません。

あるゲームのアセットのリネームや音声の抽出などができるスクリプトです。

## 使用する前に
/mnt/c/Users/ユーザ名/AppData/LocalLow/Cygames/umamusume
で実行してください(要はmetaがあるディレクトリ)。

これを実行する前にゲーム内でデータの一括ダウンロードは済ませておきましょう。
一度タイトル画面をタップして先に進まないとmetaファイルが更新されないのでそれもしておきましょう。

足りないコマンド等はスクリプト内でインストールできるようになっています。
ただしvgmstreamのインストール場所が気に入らないならそこは各々編集してください。

## 使用方法
```sh
./uma.sh
```
と入力し、エンターを押して実行すれば動きます。

### 使えるオプションについて
- -c : コピーするときにサイズを比較して等しい場合スキップします。
- -f : コピーするとき全てのファイルをコピーします。
- -j : コピーするときの並列処理数を30以下1以上の整数で設定できます。
あんまり数を増やすとパソコンが壊れないか心配なので上限を設けました。
20を超える数や数値以外が入力された場合1に設定し直されます。
- -p : 出力先のフォルダ名を変更できます(非推奨)。
ただしスペースを名前に含めることはできません。
- -s : 音声を変換するときの並行処理数を20以下1以上の整数で設定できます。
安全を見て上限を設けました。なにも設定していない場合音声の並行処理数はファイルコピーの並行処理数の1/2(切り捨て)になるように設定します。
20を超える数や数値以外が入力された場合もファイルコピーの並行処理数の1/2(切り捨て)になるように設定し直されます。
- -U : このスクリプト自体をアップデートします。
- -h : ヘルプを表示します。

例:
```sh
./uma.sh -c -j30 -s20
```

## 補足
環境構築(おまけ)の中身はZSHの環境を構築できるスクリプトです(bashのままだと少し使いにくいので)。
WSL入れたけど、どうすればいいかわからないって方はとりあえず実行してみるとある程度使える環境が出来上がると思います。

もしインストールや使用時にわからないことがあれば、解決に至る質問が先にでている可能性がありますので [issues](https://github.com/incompetence33/uma_sh/issues?q=is%3Aissue) を一度御覧ください。

それでも解決しない場合新しく質問を [new issues](https://github.com/incompetence33/uma_sh/issues/new/choose) からお書き下さい。
