#/bin/sh

PLATFORM=

if [[ $PLATFORM == "darwin" ]]
then
  go build -o ./release/tray_darwin -ldflags "-s -w" main.go
elif [[ $PLATFORM == "linux" ]]
then
  go build -o ./release/tray_linux -ldflags "-s -w" main.go
elif [[ $PLATFORM == "windows" ]]
then
  go build -o ./release/tray_windows.exe -ldflags "-s -w" main.go
elif [[ $PLATFORM == "" ]]
then
  go build -o ./release/tray_windows.exe -ldflags "-s -w" main.go
  go build -o ./release/tray_darwin -ldflags "-s -w" main.go
  go build -o ./release/tray_linux -ldflags "-s -w" main.go
else
  echo Unknown platform
fi
