
# alias pdlake='source ~/projects/chunichi_dragons/nagoya.properties; sshpass -p $ADP ssh pd-lake-vgwc-01.ipa.explorys.net'
alias adpass='source ~/projects/chunichi_dragons/nagoya.properties; echo -n $ADP | pbcopy'
alias azure='bash ~/projects/daily_scripts/osascript/azure.sh'
alias bashrc='source ~/.zshrc'
alias betapass='source ~/projects/chunichi_dragons/nagoya.properties; echo -n $BETA | pbcopy'
alias dashboards='bash ~/projects/daily_scripts/bash/merative-dashboards.sh'
alias deselect='pbcopy </dev/null'
alias gitreset='bash ~/projects/daily_scripts/git/git-repo-hard-reset.sh'
alias hdg01='source ~/projects/chunichi_dragons/nagoya.properties; sshpass -p $HDG ssh bubnicbf@whatever'
alias ipynb='bash ~/projects/daily_scripts/osascript/jupyter.sh'
alias projects="printf \"\e[8;42;181t\"; cd ~/projects/; clear; pwd; ls"
alias python="python3"
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
