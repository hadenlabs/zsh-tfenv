#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install tfenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
tfenv_package_name=tfenv

function tfenv::dependences {
    message_info "Installing Dependences"
}

function tfenv::install {
    message_info "Installing ${tfenv_package_name}"
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
}

function tfenv::configure {
    message_info "Configuring ${tfenv_package_name}"
}

function tfenv::post_install {
    message_info "PostInstall ${tfenv_package_name}"
    tfenv install 0.11.10
    tfenv install 0.12.9
    tfenv install 0.12.17
    tfenv install 0.12.18
    tfenv install 0.12.19
    tfenv use 0.12.19
}

function tfenv::load {
    path_append "${HOME}/.tfenv/bin"
}

tfenv::load

if ! type -p tfenv > /dev/null; then
    tfenv::dependences
    tfenv::install
    tfenv::configure
    tfenv::post_install
fi
