#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tfenv::install {
    tfenv::internal::tfenv::install
}

function tfenv::load {
    tfenv::internal::tfenv::load
}

function tfenv::post_install {
    message_info "Post Install ${TFENV_PACKAGE_NAME}"
    message_success "Success Install ${TFENV_PACKAGE_NAME}"
}

function tfenv::upgrade {
    tfenv::internal::tfenv::upgrade
}

function tfenv::install::versions {
    tfenv::internal::version::all::install
}

function tfenv::install::version::global {
    tfenv::internal::version::global::install
}
