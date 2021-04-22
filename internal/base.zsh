#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tfenv::internal::tfenv::install {
    message_info "Installing ${TFENV_PACKAGE_NAME}"
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    tfenv::internal::tfenv::load
    message_success "Installed ${TFENV_PACKAGE_NAME}"
}

function tfenv::internal::tfenv::load {
    [ -e "${TFENV_ROOT_BIN}" ] && export PATH="${PATH}:${TFENV_ROOT_BIN}"
}

function tfenv::internal::version::all::install {
    if ! core::exists tfenv; then
        message_warning "not found tfenv"
        return
    fi

    for version in "${TFENV_VERSIONS[@]}"; do
        message_info "Install version of terraform ${version}"
        tfenv install "${version}"
        message_success "Installed version of terraform ${version}"
    done
    tfenv global "${TFENV_VERSION_GLOBAL}"
    message_success "Installed versions of Terraform"

}

function tfenv::internal::version::global::install {
    if ! core::exists tfenv; then
        message_warning "not found tfenv"
        return
    fi
    message_info "Installing version global of terraform ${TFENV_VERSION_GLOBAL}"
    tfenv install "${TFENV_VERSION_GLOBAL}"
    tfenv use "${TFENV_VERSION_GLOBAL}"
    message_success "Installed version global of terraform ${TFENV_VERSION_GLOBAL}"
}

function tfenv::internal::tfenv::upgrade {
    message_info "Upgrade for ${TFENV_PACKAGE_NAME}"
    local path_tfenv
    path_tfenv=$(tfenv root)
    # shellcheck disable=SC2164
    cd "${path_tfenv}" && git pull && cd -
    message_success "Upgraded ${TFENV_PACKAGE_NAME}"
}
