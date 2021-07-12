# https://support.apple.com/en-us/HT208050
# If you're using .profile (a POSIX-compliant profile), you can make zsh automatically read its settings
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# https://formulae.brew.sh/cask/google-cloud-sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/legacy_credentials/jean-alexander.moninnylund@tv4.se/adc.json
