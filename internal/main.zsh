#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tfenv::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_TFENV_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_TFENV_PATH}"/internal/linux.zsh
      ;;
    esac
}

tfenv::internal::main::factory
tfenv::internal::tfenv::load

if ! core::exists curl; then core::install curl; fi
if ! core::exists tfenv; then tfenv::internal::tfenv::install; fi
