#書き換えるときには十分注意されたし。
LANG="ja_JP.UTF-8"
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-completions/zsh-completions.plugin.zsh

# あるマシンには存在するが別のマシンには存在しないパスを PATH に追加したいならば、
# パスの後ろに (N-/) をつけるとよい
# こうすると、パスの場所にディレクトリが存在しない場合、パスが空文字列に置換されるぞ。
path=(
	/commands/(N-/)
    ~/shellscripts/(N-/)
    ~/commands/(N-/)
    ~/go/bin/(N-/)
    ~/.local/bin(N-/)
    /usr/local/ffmpeg_my_build/bin/(N-/)
    /usr/local/cuda/bin/(N-/)
    /home/linuxbrew/.linuxbrew/bin(N-/)
    ~/.cargo/bin/(N-/)
    $path
)
#
#~/shellscripts に入っているスクリプトを.shなしで使えるようにする。
#そのためスクリプトの名前は既存のコマンドと被らないようにしなければならない。
#そうじゃないとそのコマンドが使えなくなっちゃうからねー。
for SCRIP in $(\ls -v ~/shellscripts/*.sh);do
	alias "$(basename ${SCRIP/%.*})"="$(basename $SCRIP)"
done
export PYTHONIOENCODING=utf-8

cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet

git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat


alias ffprobe="ffprobe -hide_banner "

#ここをいじるなら少し調べてしっかり理解してからにするといいだろう。
setopt append_history
setopt auto_cd
setopt auto_menu
setopt auto_param_slash
setopt correct_all
setopt complete_in_word
setopt extended_history
setopt globdots
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof
setopt interactive_comments
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt mark_dirs
setopt no_beep
setopt no_flow_control
setopt print_eight_bit
setopt prompt_subst
setopt share_history
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
autoload -U colors; colors
autoload -Uz compinit; compinit
autoload -Uz vcs_info
#export LSCOLORS="dxfxcxdxbxegedabagacad"
export LS_COLORS='di=34;46:ln=36;40:so=32:pi=33;40:ex=32:bd=37;46:cd=34:su=0;41:sg=0;46:tw=34;42:ow=34;42:or=31:'
export GREP_COLOR='1;33'
#cdpath=()
#
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':vcs_info:*' actionformats ' %c%u(%s:%b|%a)'
zstyle ':vcs_info:*' formats ' %c%u(%s:%b)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
alias sudo='sudo '
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
export DISPLAY=:0.0
export EDITOR='vim'
export VISUAL='vim'
#プロンプトの設定。ここを変えるとコマンドを打つ時の左側の顔を変えることができる。
IIOKAO=$'(=^^=%)'
ZANNEN=$'(-_-;%)'
#prompt
PROMPT='
%{${fg[yellow]}%}%~%{${reset_color}%}
[%n@%md]${vcs_info_msg_0_}
%(?.%F{158}${IIOKAO}.%F{205}${ZANNEN})%f%b$ '
#PROMPT='%(?.%F{158}(=^^=%).%F{205}(-_-;%))%f%b$ '                                                                                 
PROMPT2='%B%F{green}%_%f%b> '
#ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#~/.myfunctionsの中身を読み込んで実行するよ。
#このようにしてaliasを起動時に設定したり、毎回やるルーティーンを自動化できるよ。
source ~/.myfunctions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -d $HOME/.anyenv ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi
