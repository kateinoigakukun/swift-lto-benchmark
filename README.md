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
   <td colspan=4>Size</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>306.3 KB</td>
    <td>250.5 KB</td>
    <td>234.0 KB</td>
    <td>202.2 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>309.8 KB</td>
    <td>253.6 KB</td>
    <td>299.2 KB</td>
    <td>233.1 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>261.8 KB</td>
    <td>221.2 KB</td>
    <td>251.8 KB</td>
    <td>203.0 KB</td>
</tr>
</table>

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=4>Build Time</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>7.56 s</td>
    <td>9.54 s</td>
    <td>12.53 s</td>
    <td>11.61 s</td>
</tr>
<tr>
    <td>O</td>
    <td>26.60 s</td>
    <td>25.07 s</td>
    <td>28.93 s</td>
    <td>25.27 s</td>
</tr>
<tr>
    <td>Osize</td>
    <td>9.43 s</td>
    <td>10.45 s</td>
    <td>9.80 s</td>
    <td>8.80 s</td>
</tr>
</table>

#### Runtime Performance

| Variant | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `O-llvm-lto` | 8.8 ± 0.4 | 7.8 | 10.0 | 1.02 ± 0.07 |
| `O-swift-llvm-lto` | 9.1 ± 0.6 | 7.8 | 11.3 | 1.05 ± 0.09 |
| `O-swift-lto` | 8.7 ± 0.5 | 7.7 | 10.7 | 1.01 ± 0.08 |
| `O` | 8.6 ± 0.5 | 7.7 | 10.6 | 1.00 |
| `Onone-llvm-lto` | 9.9 ± 1.0 | 8.2 | 13.9 | 1.14 ± 0.13 |
| `Onone-swift-llvm-lto` | 9.2 ± 0.4 | 8.1 | 10.1 | 1.00 |
| `Onone-swift-lto` | 9.3 ± 0.7 | 8.0 | 12.6 | 1.08 ± 0.10 |
| `Onone` | 8.8 ± 0.4 | 8.0 | 10.0 | 1.02 ± 0.07 |
| `Osize-llvm-lto` | 8.9 ± 0.5 | 7.8 | 10.7 | 1.03 ± 0.08 |
| `Osize-swift-llvm-lto` | 9.0 ± 0.5 | 8.0 | 10.8 | 1.04 ± 0.08 |
| `Osize-swift-lto` | 9.0 ± 0.5 | 8.0 | 11.1 | 1.04 ± 0.08 |
| `Osize` | 8.8 ± 0.5 | 8.0 | 11.2 | 1.00 |


### SwiftSyntax
<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=4>Size</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>16.1 MB</td>
    <td>10.4 MB</td>
    <td>8.2 MB</td>
    <td>5.6 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>6.9 MB</td>
    <td>5.9 MB</td>
    <td>6.9 MB</td>
    <td>5.0 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>5.6 MB</td>
    <td>5.1 MB</td>
    <td>5.3 MB</td>
    <td>3.9 MB</td>
</tr>
</table>

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=4>Build Time</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>129.03 s</td>
    <td>113.57 s</td>
    <td>197.40 s</td>
    <td>162.43 s</td>
</tr>
<tr>
    <td>O</td>
    <td>465.21 s</td>
    <td>418.91 s</td>
    <td>470.46 s</td>
    <td>422.55 s</td>
</tr>
<tr>
    <td>Osize</td>
    <td>347.92 s</td>
    <td>314.04 s</td>
    <td>329.84 s</td>
    <td>288.65 s</td>
</tr>
</table>

#### Runtime Performance

| Variant | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `O-llvm-lto` | 10.5 ± 0.4 | 9.8 | 11.7 | 1.02 ± 0.06 |
| `O-swift-llvm-lto` | 10.7 ± 0.5 | 9.8 | 12.2 | 1.04 ± 0.07 |
| `O-swift-lto` | 10.8 ± 0.6 | 9.8 | 12.7 | 1.04 ± 0.08 |
| `O` | 10.9 ± 0.6 | 9.8 | 13.3 | 1.06 ± 0.08 |
| `Onone-llvm-lto` | 11.7 ± 0.7 | 10.7 | 13.7 | 1.13 ± 0.09 |
| `Onone-swift-llvm-lto` | 11.7 ± 0.6 | 10.7 | 14.5 | 1.00 |
| `Onone-swift-lto` | 12.3 ± 0.4 | 11.4 | 13.8 | 1.19 ± 0.07 |
| `Onone` | 12.5 ± 0.6 | 11.3 | 14.9 | 1.21 ± 0.08 |
| `Osize-llvm-lto` | 10.9 ± 0.4 | 10.0 | 12.2 | 1.05 ± 0.07 |
| `Osize-swift-llvm-lto` | 10.8 ± 0.6 | 9.5 | 12.8 | 1.04 ± 0.07 |
| `Osize-swift-lto` | 10.9 ± 0.6 | 9.7 | 12.3 | 1.05 ± 0.07 |
| `Osize` | 10.3 ± 0.5 | 9.5 | 13.1 | 1.00 |



### RxSwift

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=4>Size</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>2.8 MB</td>
    <td>2.0 MB</td>
    <td>1.8 MB</td>
    <td>1.4 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>1.6 MB</td>
    <td>1.4 MB</td>
    <td>1.6 MB</td>
    <td>1.3 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>1.5 MB</td>
    <td>1.3 MB</td>
    <td>1.5 MB</td>
    <td>1.2 MB</td>
</tr>
</table>

<table>
<tr>
   <td rowspan=2>Variant</td>
   <td colspan=4>Build Time</td>
</tr>
<tr>
    <td>non-LTO</td>
    <td>Swift LTO</td>
    <td>LLVM LTO</td>
    <td>Swift & LLVM LTO</td>
</tr>
<tr>
    <td>Onone</td>
    <td>36.82 s</td>
    <td>35.01 s</td>
    <td>51.21 s</td>
    <td>45.95 s</td>
</tr>
<tr>
    <td>O</td>
    <td>67.94 s</td>
    <td>64.33 s</td>
    <td>73.02 s</td>
    <td>66.49 s</td>
</tr>
<tr>
    <td>Osize</td>
    <td>40.80 s</td>
    <td>36.32 s</td>
    <td>34.83 s</td>
    <td>31.79 s</td>
</tr>
</table>


#### Runtime Performance

| Variant | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `O-llvm-lto` | 9.5 ± 0.6 | 8.4 | 11.5 | 1.05 ± 0.08 |
| `O-swift-llvm-lto` | 9.2 ± 0.4 | 8.4 | 10.8 | 1.01 ± 0.06 |
| `O-swift-lto` | 9.3 ± 0.5 | 8.2 | 11.2 | 1.00 |
| `O` | 9.4 ± 0.7 | 8.0 | 11.6 | 1.04 ± 0.09 |
| `Onone-llvm-lto` | 9.7 ± 0.5 | 8.7 | 11.1 | 1.07 ± 0.07 |
| `Onone-swift-llvm-lto` | 9.7 ± 1.0 | 8.7 | 20.8 | 1.07 ± 0.12 |
| `Onone-swift-lto` | 9.7 ± 0.6 | 8.5 | 11.5 | 1.07 ± 0.08 |
| `Onone` | 9.8 ± 0.8 | 8.6 | 14.3 | 1.08 ± 0.09 |
| `Osize-llvm-lto` | 9.3 ± 0.5 | 8.6 | 11.1 | 1.03 ± 0.07 |
| `Osize-swift-llvm-lto` | 9.7 ± 0.5 | 8.7 | 11.1 | 1.00 |
| `Osize-swift-lto` | 9.2 ± 0.6 | 8.2 | 11.1 | 1.01 ± 0.08 |
| `Osize` | 9.1 ± 0.4 | 8.3 | 10.3 | 1.00 |
