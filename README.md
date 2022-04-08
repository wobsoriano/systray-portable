# systray-builder

A portable version of [go systray](https://github.com/getlantern/systray), using stdin/stdout to communicate with other language. This repo is fork of [systray-portable](https://github.com/felixhao28/systray-portable) but uses [fyne's](https://github.com/fyne-io/systray) tray widget instead (removed GTK dependency and support for legacy linux system tray).

## Protocol

Each line is a json string.

tray binary =>  
=> ready  `{"type": "ready"}`  
<= init menu (with a separator)
```json
{
  "icon": "<base64 string of image>",
  "title": "Title",
  "tooltip": "Tooltips",
  "items":[
    {
      "title": "aa",
      "tooltip": "bb",
      "checked": true,
      "enabled": true,
      "hidden": false
    },
    {
      "title": "<SEPARATOR>",
      "tooltip": "",
      "checked": true,
      "enabled": true,
      "hidden": false
    },
    {
      "title": "aa2",
      "tooltip": "bb",
      "checked": false,
      "enabled": true,
      "hidden": false
    }
  ]
}
```
=> clicked  
```json
{
  "type": "clicked",
  "item":{
    "title": "aa",
    "tooltip": "bb",
    "enabled": true,
    "checked": true
  },
  "menu":{
    "icon": "",
    "title": "",
    "tooltip": "",
    "items": null
  },
  "seq_id": 0
}
```
<= update-item / update-menu / update-item-and-menu
```json
{
  "type": "update-item",
  "item":{
    "title": "aa3",
    "tooltip": "bb",
    "enabled": true,
    "checked": true
  },
  "seq_id": 0
}
```

<= exit gracefully
```json
{
  "type": "exit"
}
```

## Binary

```sh
$ ./build.sh
```
