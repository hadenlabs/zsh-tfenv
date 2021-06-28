#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export TFENV_ROOT="${HOME}/.tfenv"
export TFENV_ROOT_BIN="${TFENV_ROOT}/bin"
export TFENV_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export TF_PLUGIN_CACHE_DIR="${HOME}"/.terraform.d/plugin-cache
export TFENV_PACKAGE_NAME=tfenv
export TFENV_VERSIONS=(
    0.13.0
    0.14.10
    0.15.0
    0.15.1
    1.0.1
)
export TFENV_VERSION_GLOBAL=1.0.1
