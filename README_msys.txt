WslをインストールするとHyper-VがオンになってしまってAndroidエミュレータ等が動かないので困るという人向けにMsys2のセットアップスクリプトを作成しました。
--追記:BlueStacks5もHyper-Vに対応したのでWSL2を導入したときのデメリットだったエミュレータ問題も消えたのでWSL2の導入をおすすめします。

インストール方法(すでにmsys2環境がある人も別のところにインストールしてこれから書くことやってほしいかも。)
1. https://www.msys2.org/ よりインストーラーをダウンロードし適当なところにインストールする。
2. これをダウンロードして解凍しておく https://github.com/incompetence33/uma_sh/releases/download/ver.4.1/setup_msys2_env.zip
3. msys2をインストールしたフォルダの中のhomeというフォルダの中に自分のユーザ名のフォルダができていると思うので解凍して出てきたフォルダをそこに移動させておく。
4. ucrt64.exeを起動する。ここまできちんとできたら次のコマンドを実行する。
cd ./setup_msys2_env && ./setup.sh
5. しばらく待つとなんか聞いてくるのでエンターを押す。するとウィンドウが閉じるのでまたucrt64.exeを起動する。
6. 導入スクリプトでumamusumeフォルダのシンボリックリンクがホームにできていると思うので
cd umamusume
と入力してumamusumeフォルダに入る。
7. git clone --depth 1 https://github.com/incompetence33/uma_sh.git script_uma
と入力する。
ln -s script_uma/uma.sh 
と入力する。
8. pacu と入力し環境をアップデートする。
これで導入は終了です。

