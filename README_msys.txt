WslをインストールするとHyper-VがオンになってしまってAndroidエミュレータ等が動かないので困るという人向けにMsys2のセットアップスクリプトを作成しました。

インストール方法(すでにmsys2環境がある人も別のところにインストールしてこれから書くことやってほしいかも。)
① https://www.msys2.org/ よりインストーラーをダウンロードし適当なところにインストールする。
②これをダウンロードして解凍しておく https://github.com/incompetence33/uma_sh/releases/download/ver.4.1/setup_msys2_env.zip
③解凍してでてきた中のmsysフォルダにある「msys.bat」をインストールした場所に置く。
④msys.batを起動する。そうするとmsys2をインストールしたフォルダの中のhomeというフォルダの中に自分のユーザ名のフォルダができていると思うので解凍して出てきたフォルダをそこに移動させておく。
⑤ここまできちんとできたら次のコマンドを実行する。
./setup_msys2_env/setup.sh
⑥しばらく待つとなんか聞いてくるのでエンターを押す。するとウィンドウが閉じるのでまたmsys.batを起動する。
⑦導入スクリプトでumamusumeフォルダのシンボリックリンクがホームにできていると思うので
cd umamusume
と入力してumamusumeフォルダに入る。
⑧git clone --depth 1 https://github.com/incompetence33/uma_sh.git
と入力する。
ln -s uma_sh/uma.sh
と入力する。
これで導入は終了です。
なぜバッチファイルから起動するかというと、mingw64.exeやucrt64.exeから起動するとfzfというコマンドが使えないためです。
バッチファイルはわかりやすい適当な名前に変えてもらってもOKです。

