# ~/.ashrc: interactive shell configuration for BusyBox Ash

### Custom Aliases ###

# system
alias x="exit"
alias clr="clear"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias sudo="doas"

# containers
alias docker="sudo nerdctl"
alias garage="docker exec -it ente-s3 /garage"
alias tailup="docker exec -it tailscale ts-services.sh"
alias recompose="docker compose down && docker compose up -d"

# AWS
source "$HOME/.awsrc"
