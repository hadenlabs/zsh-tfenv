#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install tfenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function tfenv::dependences {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Dependences${CLEAR}"
}

function tfenv::install {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Tfenv${CLEAR}"
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
}

function tfenv::configure {
    echo -e "${CLEAR}${LIGHT_GREEN}Configuring Tfenv${CLEAR}"
}

function tfenv::post_install {
    echo -e "${CLEAR}${LIGHT_GREEN}Post Install Tfenv${CLEAR}"
    tfenv install 0.12.6
    tfenv install 0.11.10
}

function tfenv::load {
    [[ -e "$HOME/.tfenv/bin" ]] && export PATH="$PATH:$HOME/.tfenv/bin"
}

tfenv::load

if (( ! $+commands[tfenv] )); then
    tfenv::dependences
    tfenv::install
    tfenv::configure
    tfenv::post_install
fi
