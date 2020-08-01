# swift-lto-benchmark

## Build

```sh
$ ./utils/build-script path/to/swiftc
```


## Result

| variant | file path | size |
| :-:| :-:|:-:|
| -Onone | build/Onone/Example/SwiftyJSONExample | 273K |
| -Onone + LTO | build/Onone-LTO/Example/SwiftyJSONExample | 225K |
| -O | build/O/Example/SwiftyJSONExample | 282K |
| -O + LTO | (compiler crashed) |  |
