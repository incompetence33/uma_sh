#書き換えるときには十分注意されたし。
#export MSYS_NO_PATHCONV=1
#export MSYS2_ARG_CONV_EXCL="*"


LANG="ja_JP.UTF-8"
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-completions/zsh-completions.plugin.zsh
# あるマシンには存在するが別のマシンには存在しないかもしれないパスを PATH に追加したいならば、
# パスの後ろに (N-/) をつけるとよい
path=(
    ~/shellscripts/(N-/)
    ~/comannds/bin/(N-/)
    ~/go/bin/(N-/)
    /ucrt64/bin
    /usr/local/ffmpeg_/bin/(N-/)
    /usr/local/exes/(N-/)
    /usr/local/cmake_3.20.0/bin/(N-/)
    $path
)
#


#ls系のやつとか
alias l='ls -v1 --color --group-directories-first'
alias la='ls -lavh --color --group-directories-first'
alias ll='ls -lh --color --group-directories-first'
alias ls='ls --color --group-directories-first'
alias grep='grep --color=auto --group-directories-first'
alias ...='cd ../../'
alias mkdir='mkdir -p'
alias gic='git clone --depth 1 '
#ここをいじるなら少し調べて理解してからにするといいだろう。
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
#Mac用
#export LSCOLORS="dxfxcxdxbxegedabagacad"
export LS_COLORS='di=34;46:ln=36;40:so=32:pi=33;40:ex=32:bd=37;46:cd=34:su=0;41:sg=0;46:tw=0;34;42:ow=0;34;42:or=31:'
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
PROMPT2='%B%F{green}%_%f%b> '
#ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#~/.myfunctionsの中身を読み込んで実行するよ。
#このようにしてaliasを起動時に設定したり、毎回やるルーティーンを自動化できるよ。
source ~/.myfunctions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
