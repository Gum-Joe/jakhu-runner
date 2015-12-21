#!/bin/bash
echo "Setting enviroment variables for this tub..."
echo export BOSS_APP_DIR=vagrant
export BOSS_APP_DIR=vagrant
echo export BOSS_APP_NAME=foo
export BOSS_APP_NAME=foo
echo export BOSS_WORKER_NAME=default
export BOSS_WORKER_NAME=default

# Tub envs
export BOSS_LANG_VERSION=stable
