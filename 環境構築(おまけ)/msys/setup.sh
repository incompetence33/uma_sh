#!/bin/bash
if [[ ! "${MSYS}" == 'winsymlinks:nativestrict' ]]; then echo "msysをインストールした場所に入っているucrt64.iniを開き、";echo "#MSYS=winsymlinks:nativestrict";echo "となっている部分の先頭の「#」を外し、";echo "MSYS=winsymlinks:nativestrict";echo "となるようにしてください。もしくはそのように追記してください。";echo "その後もう一度ucrt64.exeを実行してからこのスクリプトを実行してください。";exit 1;fi
if [[ ! (-f "mirrorlist.msys" && -f "mirrorlist.ucrt64" && -f "pacman.conf" && -f ".zshrc" && ".myfunctions" && ".minttyrc") ]]; then echo "このスクリプトと同じディレクトリで実行してください。";echo "具体的には、mirrorlist.msysなどがあるところです。";exit 1;fi
rm -f /etc/pacman.conf /etc/pacman.d/mirrorlist.msys /etc/pacman.d/mirrorlist.ucrt64
cp mirrorlist.msys /etc/pacman.d/mirrorlist.msys
cp mirrorlist.ucrt64 /etc/pacman.d/mirrorlist.ucrt64
cp pacman.conf /etc/pacman.conf
cp .zshrc ~/.zshrc
cp .myfunctions ~/.myfunctions
cp .minttyrc ~/.minttyrc
echo 'exec zsh -l' >> ~/.bashrc
pacman -Syy
cd ~
while true;do
  yes ' ' | pacman -S bc bison diffutils flex git openssh rsync tar unrar unzip zsh mingw-w64-ucrt-x86_64-aria2 mingw-w64-ucrt-x86_64-cmake mingw-w64-ucrt-x86_64-icu mingw-w64-ucrt-x86_64-libzip mingw-w64-ucrt-x86_64-perl mingw-w64-ucrt-x86_64-sqlite3 && break
done
git clone git://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
ln -s /ucrt64/bin/mingw32-make.exe /ucrt64/bin/make.exe

ln -s /c /c_drive
if [[ -d /c_drive/Users/$(whoami)/AppData/LocalLow/Cygames/umamusume/ ]]; then
	ln -s /c_drive/Users/$(whoami)/AppData/LocalLow/Cygames/umamusume/
fi

while true;do
  pacman -Syyu && break
done
