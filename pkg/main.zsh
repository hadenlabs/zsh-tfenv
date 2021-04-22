#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tfenv::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_TFENV_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/pkg/linux.zsh
      ;;
    esac

}

tfenv::pkg::main::factory
