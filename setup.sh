#!/bin/bash

# The script with which one enters the "dev environment". It creates a new cmd-session and loads in a new bash session and loads in important variables and functions.

# So p(ush|op)d becomes quiet
pushd() {
    command pushd "$@" > /dev/null
}

popd() {
    command popd "$@" > /dev/null
}

pushd '.'

cd 'scripts/dev'
source env.sh

popd