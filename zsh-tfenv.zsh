#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install tfenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
tfenv_package_name=tfenv
TFENV_VERSION_LATEST=0.12.19

TFENV_ROOT_DIR=$(dirname "$0")
TFENV_SRC_DIR="${TFENV_ROOT_DIR}"/src

TFENV_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"

# shellcheck source=/dev/null
source "${TFENV_SRC_DIR}"/base.zsh


function tfenv::dependences {
    message_info "Installing Dependences"
}

function tfenv::install {
    message_info "Installing ${tfenv_package_name}"
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    tfenv::post_install
}

function tfenv::install::version::global {
    message_info "Installing version gloabal for ${tfenv_package_name}"
    tfenv install "${TFENV_VERSION_LATEST}"
    tfenv use "${TFENV_VERSION_LATEST}"
    message_success "Installed version global for ${tfenv_package_name}"

}

function tfenv::install::versions::async {
    async_init
    # Start a worker that will report job completion
    async_start_worker tfenv_worker_install_version -u

    # Register our callback function to run when the job completes
    async_register_callback tfenv_worker_install_version tfenv::install::version::callback

    # Start the job
    async_job tfenv_worker_install_version tfenv::install::versions
}

function tfenv::install::versions::factory {
    if command -v async_init > /dev/null; then
        tfenv::install::versions::async
        return
    fi
    tfenv::install::versions
}

# Define a function to process the result of the job
function tfenv::install::version::callback {
    message_success "Finish:: ${1}"
}

function tfenv::install::versions {
    message_info "Installing versions for ${tfenv_package_name}"
    if ! type -p tfenv > /dev/null; then
        message_warning "not found tfenv, please install tfenv"
        return
    fi
    tfenv install 0.11.10
    tfenv install 0.12.9
    tfenv install 0.12.17
    tfenv install 0.12.18
    message_success "Installed versions for ${tfenv_package_name}"
}

function tfenv::install::packages {
    message_info "Installing packages for ${tfenv_package_name}"
    message_success "Installed packages for ${tfenv_package_name}"
}

function tfenv::post_install {
    tfenv::load
    message_info "Installing other tools for ${tfenv_package_name}"
    tfenv::install::version::global
    tfenv::install::packages
    tfenv::install::versions::factory
    message_success "Success install other tools for ${tfenv_package_name}"
}

function tfenv::load {
    [ -e "${HOME}/.tfenv/bin" ] && export PATH="${PATH}:${HOME}/.tfenv/bin"
}

tfenv::load

if ! type -p tfenv > /dev/null; then
    tfenv::install
fi
