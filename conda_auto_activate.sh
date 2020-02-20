#!/bin/bash

# conda_auto_activate automatically activates a conda environment when
# enterring a folder that contains a .condaauto file. The first line in the
# .condaauto file is the name of the conda environment.
#
# To make this work you have to source conda_auto_activate.sh from your
# ~/.bashrc.

function _conda_auto_activate() {
  if [ -e ".condaauto" ]; then
    # echo ".condaauto file found"
    ENV=$(head -n 1 .condaauto)

    # Check to see if already activated to avoid redundant activating
    if [[ $PATH == *"$ENV"* ]]; then
      echo "Conda env '$ENV' already activated."
    else
      conda activate $ENV
    fi
  fi
}

function chpwd() {
  _conda_auto_activate
}
