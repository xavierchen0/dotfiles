#!/bin/bash

# ==========================================================
# My setup code for a new machine (MacOS)
# 
# Note:
#   - Ensure that SSH keys are downloaded into local machine, 
#     and added to ssh agent.
# ===========================================================

# -- Authenticate once --
sudo -v

# -- Setup colors --
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No color

# -- Init variables --
XDG_CONFIG_HOME="$HOME/.config/"

# -- Install Homebrew --
printf "%s%b%-8s%b%s %s\n" "[  " "${BLUE}" "WORKING" "${NC}" " ]" "Installing Homebrew" 
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
printf "%s%b%-8s%b%s %s\n" "[  " "${GREEN}" "  DONE" "${NC}" " ]" "Installing Homebrew" 

# -- Install Git --
printf "%s%b%-8s%b%s %s\n" "[  " "${BLUE}" "WORKING" "${NC}" " ]" "Installing Git" 
if ! command -v git &> /dev/null; then
  brew install git
fi
printf "%s%b%-8s%b%s %s\n" "[  " "${GREEN}" "  DONE" "${NC}" " ]" "Installing Git" 

# -- Git clone dotfiles --
printf "%s%b%-8s%b%s %s\n" "[  " "${BLUE}" "WORKING" "${NC}" " ]" "Git Clone dotfiles" 
if [[ ! -d ${XDG_CONFIG_HOME} ]]; then
  git clone git@github.com:xavierchen0/dotfiles.git ${XDG_CONFIG_HOME}
fi
printf "%s%b%-8s%b%s %s\n" "[  " "${GREEN}" "  DONE" "${NC}" " ]" "Git Clone dotfiles" 

# -- Install software and packages via Brew bundle --
printf "%s%b%-8s%b%s %s\n" "[  " "${BLUE}" "WORKING" "${NC}" " ]" "Installing via Brewfile" 
if ! brew bundle check --file="${XDG_CONFIG_HOME}/Brewfile"; then
  brew bundle cleanup --file="${XDG_CONFIG_HOME}/Brewfile"
  brew bundle --file="${XDG_CONFIG_HOME}/Brewfile"
fi
printf "%s%b%-8s%b%s %s\n" "[  " "${GREEN}" "  DONE" "${NC}" " ]" "Installing via Brewfile" 
