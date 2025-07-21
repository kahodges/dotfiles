# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s histappend

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# default aliases
alias nuke='rm -rf ./*'
alias own="sudo chown -R $USER: ."
alias grep='grep --color=auto'
alias igrep='grep -i'
alias biggest="du -h --max-depth=1 | sort -h"
alias symlink_search="find . -maxdepth 1 -type l -ls"
alias j="jobs"
alias follow="tail -f -n +1"
alias rdinstall='rosdep install -y --from-path src --ignore-src'
alias rdcheck='rosdep check --from-paths src --ignore-src'

# git aliases
alias gu='git push'
alias gd='git pull'
alias ga='git add'
alias gb='git branch -a'
alias gs='git status'
alias gr='git restore --staged .'
alias gf='git fetch'
alias gc='git commit -m "'
alias gch='git checkout'
alias gbn='git checkout -b'

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# chmod aliases
alias everyone='chmod 777'  # rwxrwxrwx
alias meonly='chmod 600'    # rw-------
alias xecute='chmod 755'     # rwxr-xr-x

# iproute2 - colours
alias ip='ip --color=auto'

# COLOURS! YAAAY!
export TERM=xterm-256color
export VISUAL='vim'

# Obviously.
#export EDITOR=/usr/bin/vim

# Personal binaries
#export PATH=${PATH}:~/bin:~/.local/bin:~/etc/scripts

# I'd quite like for Go to work please.
#export PATH=${PATH}:/usr/local/go/bin
#export GOPATH=~

# Change up a variable number of directories
# E.g:
#   cu   -> cd ../
#   cu 2 -> cd ../../
#   cu 3 -> cd ../../../
function cu {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}


# Open all modified files in vim tabs
function vimod {
    vim -p $(git status -suall | awk '{print $2}')
}

# Open files modified in a git commit in vim tabs; defaults to HEAD. Pop it in your .bashrc
# Examples: 
#     virev 49808d5
#     virev HEAD~3
function virev {
    commit=$1
    if [ -z "${commit}" ]; then
      commit="HEAD"
    fi
    rootdir=$(git rev-parse --show-toplevel)
    sourceFiles=$(git show --name-only --pretty="format:" ${commit} | grep -v '^$')
    toOpen=""
    for file in ${sourceFiles}; do
      file="${rootdir}/${file}"
      if [ -e "${file}" ]; then
        toOpen="${toOpen} ${file}"
      fi
    done
    if [ -z "${toOpen}" ]; then
      echo "No files were modified in ${commit}"
      return 1
    fi
    vim -p ${toOpen}
}

# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function gitPrompt {
  command -v __git_ps1 > /dev/null && __git_ps1 " [%s]"
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Red name for root
# if [ "${UID}" -eq "0" ]; then 
#   nameC="${txtred}" 
# fi

# Patent Pending Prompt
export PS1="${txtylw}▶ ${txtcyn}\w${txtpur}\$(gitPrompt)${txtrst} "

#export DOCKER_HOST=unix:///run/user/1000/docker.sock

# ---------------------------------------------------------
# ROS
# ---------------------------------------------------------

alias cba='colcon build'
alias cbs='colcon build --packages-select'
alias sws='source ./install/setup.bash'

export _colcon_cd_root=-/ros2_install
export ROS_DISTRO=jazzy
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

#source /opt/ros/jazzy/setup.bash
#source /usr/share/colcon_cd/function/colcon_cd.sh

#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

#export CYCLONEDDS_URI=file://$HOME/.ros/dds/config.xml
