#!/usr/bin/env bash

PLATFORM=

package=github.com/wobsoriano/systray-portable

platforms=(
  "darwin/amd64"
  "darwin/arm64"
  "linux/386"
  "linux/amd64"
  "linux/arm64"
  "windows/386"
  "windows/amd64"
)

if [[ -n ${1:-$PLATFORM} ]]; then
  platforms=("${1:-$PLATFORM}")
fi

for platform in "${platforms[@]}"; do
  export GOOS=${platform%/*} GOARCH=${platform#*/}
  output_name="tray_${GOOS}_${GOARCH}"

  if [[ $GOOS == "windows" ]]; then
    output_name+=".exe"
  fi

  echo -e "Building $platform...\n"

  if ! go build -o "./release/$output_name" $package; then
    echo -e "\nFailed to build $platform"
    exit 1
  fi
done
