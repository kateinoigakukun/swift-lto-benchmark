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
    <td>251K</td>
    <td>306K</td>
</tr>
<tr>
    <td>-O</td>
    <td>254K</td>
    <td>311K</td>
</tr>
<tr>
    <td>-Osize</td>
    <td>221K</td>
    <td>278K</td>
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
    <td>16M</td>
</tr>
<tr>
    <td>-O</td>
    <td>5.9M</td>
    <td>6.9M</td>
</tr>
<tr>
    <td>-Osize</td>
    <td>5.1M</td>
    <td>5.6M</td>
</tr>
</table>


### RxSwift

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
    <td>2.0M</td>
    <td>2.8M</td>
</tr>
<tr>
    <td>-O</td>
    <td>1.4M</td>
    <td>1.6M</td>
</tr>
<tr>
    <td>-Osize</td>
    <td>1.3M</td>
    <td>1.5M</td>
</tr>
</table>
