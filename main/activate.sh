export PATH="/storage/replicated/cirad_users/girodollej/pixi-envs/main/.pixi/envs/default/bin:/storage/replicated/cirad/binaries/ifb/miniconda3/envs/agat-1.4.2/bin:/storage/replicated/cirad/binaries/ifb/miniconda3/bin:/home/girodollej/replicated/pixi-envs/bin:/home/girodollej/.pixi/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/girodollej/.local/bin:/home/girodollej/bin"
export CONDA_SHLVL=1
export CONDA_PREFIX=/storage/replicated/cirad_users/girodollej/pixi-envs/main/.pixi/envs/default
export PIXI_PROJECT_NAME=main
export PIXI_IN_SHELL=1
export PIXI_PROJECT_ROOT=/storage/replicated/cirad_users/girodollej/pixi-envs/main
export PIXI_PROJECT_VERSION=0.1.0
export PIXI_PROJECT_MANIFEST=/storage/replicated/cirad_users/girodollej/pixi-envs/main/pixi.toml
export PIXI_EXE=/storage/simple/users/girodollej/.pixi/bin/pixi
export CONDA_DEFAULT_ENV=main
export PIXI_ENVIRONMENT_NAME=default
export PIXI_ENVIRONMENT_PLATFORMS=linux-64
export PIXI_PROMPT='(main) '
. /storage/replicated/cirad_users/girodollej/pixi-envs/main/.pixi/envs/default/etc/conda/activate.d/libglib_activate.sh
. /storage/replicated/cirad_users/girodollej/pixi-envs/main/.pixi/envs/default/etc/conda/activate.d/libxml2-split_activate.sh
source /storage/replicated/cirad_users/girodollej/pixi-envs/main/.pixi/envs/default/share/bash-completion/completions/*

# shellcheck shell=bash
pixi() {
    local first_arg="${1-}"

    "${PIXI_EXE-}" "$@" || return $?

    case "${first_arg-}" in
    add | a | remove | rm | install | i)
        eval "$("$PIXI_EXE" shell-hook --change-ps1 false)"
        hash -r
        ;;
    esac || :

    return 0
}

export PS1="(main) ${PS1:-}"
