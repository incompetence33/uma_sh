WslをインストールするとHyper-VがオンになってしまってAndroidエミュレータ等が動かないので困るという人向けにMsys2のセットアップスクリプトを作成しました。

インストール方法(すでにmsys2環境がある人も別のところにインストールしてこれから書くことやってほしいかも。)
1. https://www.msys2.org/ よりインストーラーをダウンロードし適当なところにインストールする。
2. これをダウンロードして解凍しておく https://github.com/incompetence33/uma_sh/releases/download/ver.4.1/setup_msys2_env.zip
3. 解凍してでてきた中のmsysフォルダにある「msys.bat」をインストールした場所に置く。
4. msys.batを起動する。そうするとmsys2をインストールしたフォルダの中のhomeというフォルダの中に自分のユーザ名のフォルダができていると思うので解凍して出てきたフォルダをそこに移動させておく。
5. ここまできちんとできたら次のコマンドを実行する。
./setup_msys2_env/setup.sh
6. しばらく待つとなんか聞いてくるのでエンターを押す。するとウィンドウが閉じるのでまたmsys.batを起動する。
7. 導入スクリプトでumamusumeフォルダのシンボリックリンクがホームにできていると思うので
cd umamusume
と入力してumamusumeフォルダに入る。
8. git clone --depth 1 https://github.com/incompetence33/uma_sh.git script_uma
と入力する。
ln -s script_uma/uma.sh 
と入力する。
これで導入は終了です。
なぜバッチファイルから起動するかというと、mingw64.exeやucrt64.exeから起動するとfzfというコマンドが使えないためです。
バッチファイルはわかりやすい適当な名前に変えてもらってもOKです。

