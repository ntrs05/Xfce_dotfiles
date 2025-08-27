# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Texteditor and zshconfig aliases
alias sublime="subl"
alias s="subl"
alias zshconfig="subl ~/.zshrc"
export SVN_EDITOR=subl

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial repo python history-substring-search vagrant docker brew encode64 web-search colored-man-pages extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Path for custom binaries, scripts, etc.
# export PATH="/usr/local/sbin:$HOME/repos/go/bin:$PATH"
export GOPATH="/usr/local/opt/go/libexec/bin"

alias md5sum="md5"

# Set exa instead of ls
alias ls="exa"
alias l="exa -alh"
# set ccat instead of cat
alias cat="ccat"

# set python2 as standard
alias python="python2"
alias pip="python2 /usr/local/lib/python2.7/site-packages/pip"


# Rust path variables
# LD_LIBRARY_PATH=$HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib
# export PATH=/usr/local/sbin:/usr/local/bin:$PATH:$HOME/bin:$HOME/.cargo/bin
# export RLS_ROOT=${HOME}/repos/rls
# export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/nightly-x86_64-apple-darwin/lib

# if [[ $(rustup show | sed '1,11d' | sed '2d') == nightly* ]]; then
#   export RUST_SRC_PATH="${HOME}/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/"
#   #export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/nightly-x86_64-apple-darwin/lib
# elif [[ $(rustup show | sed '1,11d' | sed '2d') == stable* ]]; then
#   export RUST_SRC_PATH="${HOME}/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"
#   #export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib
# fi

# rustup_stable() {
#   rustup default stable
#   export RUST_SRC_PATH="${HOME}/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"
#   #export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/stable-x86_64-apple-darwin/lib
# }

# rustup_nightly() {
#   rustup default nightly
#   export RUST_SRC_PATH="${HOME}/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/"
#   # export DYLD_LIBRARY_PATH=${HOME}/.rustup/toolchains/nightly-x86_64-apple-darwin/lib
# }

# Have no chaining duplicates (meaning only the latest command if same command executed multiple times) in hist
export HISTCONTROL=ignoreboth:erasedups

# Set up rvm if installed
if [ -d $HOME/.rvm ]; then
    export PATH=$PATH:$HOME/.rvm/bin
    source $HOME/.rvm/scripts/rvm
fi

# Announce 256 bit color support
export TERM=xterm-256color

# Alias for quickly reaching my ctfbox
alias ctfbox='cd ~/vagrant/boxes/ctfbox'
alias ctfboxup='ctfbox; vagrant up; vagrant ssh'

# Good old netcat
# alias nc=ncat

# Mac list open ports
alias show_open_ports="sudo lsof -i -n -P"
alias open_ports="show_open_ports"

# get public ip
alias show_public_ip="curl -Ss icanhazip.com"
alias public_ip="show_public_ip"
alias copy_public_ip="show_public_ip | pbcopy"
alias show_public_ip_v4="curl -Ss4 icanhazip.com/v4"
alias public_ip_v4="show_public_ip_v4"
alias copy_public_ip_v4="show_public_ip_v4 | pbcopy"
alias show_public_ip_v6="curl -Ss6 icanhazip.com/v6"
alias public_ip_v6="show_public_ip_v6"
alias copy_public_ip_v6="show_public_ip_v6 | pbcopy"

# encode/decode currently copied as base64
alias encode_clipboard_base64="pbpaste | base64 | pbcopy"
alias encode_clipboard="encode_clipboard_base64"
alias base64_clipboard="encode_clipboard_base64"
alias decode_clipboard_base64="pbpaste | base64 --decode | pbcopy"
alias decode_clipboard="decode_clipboard_base64"
alias base64_clipboard_decode="decode_clipboard_base64"

# Less gdb output
#alias gdb='gdb -q'

# Use C++11 standard by default
alias g++='g++ --std=c++11'
alias clang++='clang++ --std=c++11'

# Update pip packages
alias pipupgrade="pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 pip install -U"
alias pipupgrade_sudo="pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 sudo pip install -U"

# # Update osx software
# alias updateosx="sudo softwareupdate -ia"

# osc show battery status
alias battery='pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto'

# shortcut for web_search
alias \?="ddg"

# we want to use ripgrep instead of grep.
alias grep="echo Using rg instead of grep; rg"

# Start Radare2 with -A flag.
alias r2='r2 -AA'

# Start ROPgadget automatically with a binary as first argument
# alias ROPgadget='ROPgadget --binary'

#
# Highlights every occurande of the search pattern while displaying the whole content
#
# usage: cmd | highlight search_pattern
#        highlight search_pattern file
highlight() {
    grep -E "$|$1" --color $2
}

#
# cat with syntax highlighting
#
# usage: scat file1 file2 ...
#
scat() {
  for arg in "$@"; do
    pygmentize -g "$arg" 2> /dev/null || cat "$arg"
  done
}

#
# Create a new directory and cd into it
# Similar to "mkdir xxx && cd $_"
#
mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

#
# Upgrade brew stuff, pip stuff and radare
#
updateAndUpgrade() {
    echo "Start updating and upgrading. This may take a while"
    upgrade_oh_my_zsh
    echo "****************************************************************"
    echo "brew..."
    brew update --verbose && brew upgrade && brew cleanup
    echo "****************************************************************"
    echo "Updating rust"
    rustup update
    echo "****************************************************************"
    echo "pip..."
    pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 python2 /usr/local/lib/python2.7/site-packages/pip install -U
    pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 sudo -H python2 /usr/local/lib/python2.7/site-packages/pip install -U
    # echo "****************************************************************"
    # echo "radare2..."
    # cd "$HOME/repos/radare2"
    # sys/user.sh
    # cd - > /dev/null;
}

sshuttle_start_daemon() {
    sshuttle -D --dns --pidfile /tmp/.sshuttle.pid -r deploy@cloud.janke.im:22 0/0
    echo "Started sshuttle with pid $(cat /tmp/.sshuttle.pid)"
}

sshuttle_start() {
    sshuttle --dns -r deploy@cloud.janke.im:22 0/0
}

#
# Share files using transfer.io
#
# Uploads the provided file or data (if being piped to) to https://transfer.sh and puts the resulting URL into the OS clipboard.
#
# usage:
#   transfer <file>
#   some_command | transfer filename.txt
#
transfer() {
    if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage:\ntransfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    file=$1
    tmpfile=$(mktemp -t transferXXX)
    basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

    if [ -t 0 ]; then
        # stdin is a terminal, so assume the user wants to upload a local file/directory (as opposed to piping the data to this function).
        if [ ! -e $file ]; then
            echo "File $file doesn't exists."
            return 1
        fi

        if [ -d $file ]; then
            # zip directory content and transfer.
            zipfile=$(mktemp -t transferXXX.zip)
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file.
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else
        # stdin is not a terminal. Presumably someone is piping something to us, so upload that.
        curl --progress-bar --upload-file - "https://transfer.sh/$basefile" >> $tmpfile
    fi

    cat $tmpfile
    # Put resulting URL (without trailing whitespace) into the OS clipboard (OS X only)
    cat $tmpfile | tr -d '\n\r' | pbcopy
    rm -f $tmpfile
}

# uses pdflatex and biber to build a pdf out of a given tex file
pdfbuild() {
	if [ $# -eq 0 ]
	  then
	    echo "No arguments supplied"
	    return 1
	fi
	pdflatex $1 && biber ${1%.*} && pdflatex $1 && pdflatex $1
}

markdown2pdf() {
  if [ ! -n "$1" -o ! -f "$1" ]; then
    echo "Provide an existing input markdown file"
  elif [ ! "${1##*.}" = "md" ]; then
    echo "Provided file is no markdown file!"
  else
    pandoc $1 -f markdown -t latex -s -o ${1%.*}.pdf
  fi
}

fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc
compinit
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/sqlite/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

fastfetch