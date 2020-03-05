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

function terraform-docs::install {
    if ! type -p brew > /dev/null; then
        message_warning "${TFENV_MESSAGE_BREW}"
        return
    fi
    message_info "Installing terraform docs"
    brew install terraform-docs
    message_success "Installed terraform docs"
}


if ! type -p terragrunt > /dev/null; then
    terragrunt::install
fi

if ! type -p terraform-docs > /dev/null; then
    terraform-docs::install
fi