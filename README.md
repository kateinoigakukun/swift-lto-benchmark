# swift-lto-benchmark

## Build

```sh
$ ./utils/build-script path/to/swiftc
```


## Result

| variant | file path | size (byte) |
| :-      | :-        | :-:  |
| -Onone | build/Onone/Example/SwiftyJSONExample | 279920 |
| -Onone + LTO | build/Onone-LTO/Example/SwiftyJSONExample | 230900 |
| -O | build/O/Example/SwiftyJSONExample | 288384 |
| -O + LTO | build/O-LTO/Example/SwiftyJSONExample | 230836 |
