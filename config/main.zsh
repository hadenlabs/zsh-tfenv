#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tfenv::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_TFENV_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/config/linux.zsh
      ;;
    esac
}

tfenv::config::main::factory