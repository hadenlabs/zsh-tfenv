#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install tfenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_TFENV_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_TFENV_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_TFENV_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_TFENV_PATH}"/pkg/main.zsh
