#!/bin/sh
set -e

root="$(dirname $(readlink -f ${0}))"

bustle_datadir="${root}"
export bustle_datadir

bustle_localedir="${root}/locale"
export bustle_localedir

LD_LIBRARY_PATH="${root}/lib:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH

bustle="${root}"/bin/bustle

exec $bustle "${@}"
