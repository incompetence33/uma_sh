#!/bin/bash
trap "echo;echo 'CTRL+C が入力されたので終了します';exit 1" SIGINT
DISTRIBUTION="$(cat /etc/os-release | grep "^NAME=" |awk -F '=' '{gsub(/"/,"",$2);printf $2"\n"}')"
BASEPOINT="$(pwd -P)"
setup_ubuntu(){
LANG="ja_JP.UTF-8"
echo "これは簡易的な環境構築スクリプトです。"
echo "Wslをインストールしてこれから環境を0から作らなければいけない方向けのスクリプトです。"
echo "これを実行するとログインShellはZshになります。"
echo "oh-my-zshやPreztoみたいなものは導入しません。"
echo "それでも最低限使っていけるようにはなっていますが各々カスタマイズして使いやすいようにしてください。"
echo "あ、vimもインストールするので拒否反応が出る方は後でアンインストールしておいてください。"
echo "途中何回かパスワードを求められると思いますが、全てUbuntuをインストールしたときに決めたものを入力すればOKです。"
read -e -p "よろしければなにかキーを押してください。"
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && \
sudo apt install aria2 audacious audacious-dev autoconf automake git jq lame language-pack-ja libao-dev libglib2.0-dev libgtk2.0-dev liblz4-tool libmpg123-dev libpango1.0-dev libspeex-dev libtool libvorbis-dev make manpages-ja manpages-ja-dev nkf peco perl pkg-config rename sqlite3 tar unar unzip vim x11-utils zsh
curl -sLo ~/zsh_setup_rcs.zip "$(curl -sL "https://github.com/incompetence33/uma_sh/releases/latest/"|grep '/zsh_setup_rcs.zip"'|awk -F'["]' '{printf "https://github.com%s\n",$2}')"
unzip -qod ~/ ~/zsh_setup_rcs.zip 
if [[ ! -e ~/zshrc && ! -e ~/myfunctions ]]; then echo "zshrc と myfunctionsがこのスクリプトと同じ階層にありません。";echo "自分でちゃんと.zshrcくらい作ってる！って方はこのスクリプトの9行目をコメントアウトか削除してください。";exit 1;fi
mv ~/.zshrc ~/.zshrc_bak
mv ~/zshrc ~/.zshrc
mv ~/myfunctions ~/.myfunctions
rm ~/zsh_setup_rcs.zip
echo "デフォルトのShellをBashからZshにします。"
echo "パスワードを入力してください。"
sudo sed '$a /bin/zsh' /etc/shells
chsh -s /usr/bin/zsh
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
sudo update-locale LANG="ja_JP.UTF-8"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
yes | ~/.fzf/install 
echo "このウィンドウを閉じてもう一度WSLを起動したときZshになっていればOKです。"
rm ~/setup_ubuntu_zsh.sh
}

if [[ "${DISTRIBUTION}" == *buntu ]]; then cd ~;setup_ubuntu;else echo "WSLのUbuntu用のSetUpスクリプトなのでUbuntuで実行してください。";fi
