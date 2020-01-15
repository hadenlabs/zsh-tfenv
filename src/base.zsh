#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function terragrunt::install {
    if ! type -p brew > /dev/null; then
        message_warning "${TFENV_MESSAGE_BREW}"
        return
    fi
    message_info "Installing terragrunt"
    brew install terragrunt
    message_success "Installed terragrunt"
}

if ! type -p terragrunt > /dev/null; then
    terragrunt::install
fi
