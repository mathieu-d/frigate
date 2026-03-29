#!/bin/bash

set -euxo pipefail

hailo_version="5.1.1"

if [[ "${TARGETARCH}" == "amd64" ]]; then
    arch="x86_64"
elif [[ "${TARGETARCH}" == "arm64" ]]; then
    arch="aarch64"
fi

wget -qO- "https://github.com/mathieu-d/hailort/releases/download/v${hailo_version}/hailort-debian12-${TARGETARCH}.tar.gz" | tar -C / -xzf -
wget -P /wheels/ "https://github.com/mathieu-d/hailort/releases/download/v${hailo_version}/hailort-${hailo_version}-cp311-cp311-linux_${arch}.whl"
