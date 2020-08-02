# swift-lto-benchmark

## Build

```sh
$ ./utils/build-script path/to/swiftc
```


## Result

### SwiftyJSON

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=3>Size</td>
</tr>
<tr>
    <td>LTO-ed</td>
    <td>non-LTO-ed</td>
</tr>
<tr>
    <td>-Onone</td>
    <td>249K</td>
    <td>305K</td>
</tr>
<tr>
    <td>-O</td>
    <td>253K</td>
    <td>310K</td>
</tr>
<tr>
    <td>-Osize</td>
    <td>220K</td>
    <td>277K</td>
</tr>
</table>

### SwiftSyntax

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=3>Size</td>
</tr>
<tr>
    <td>LTO-ed</td>
    <td>non-LTO-ed</td>
</tr>
<tr>
    <td>-Onone</td>
    <td>10M</td>
    <td>13M</td>
</tr>
<tr>
    <td>-O</td>
    <td>5.8M</td>
    <td>5.9M</td>
</tr>
<tr>
    <td>-Osize</td>
    <td>5.0M</td>
    <td>5.6M</td>
</tr>
</table>