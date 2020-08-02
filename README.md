# swift-lto-benchmark

## Build

```sh
$ ./utils/build-script path/to/swiftc
```


## Result

### SwiftyJSON

| variant      | size (byte) |
| :----------- | :---------- |
| -Onone       | 279920      |
| -Onone + LTO | 230900      |
| -O           | 288384      |
| -O + LTO     | 230836      |

### SwiftSyntax

| variant      | size (byte) |
| :----------- | :---------- |
| -Onone       | 13875832    |
| -Onone + LTO | 10821912    |
| -O           | 6137936     |
| -O + LTO     | 6068400     |
