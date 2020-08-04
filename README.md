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

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Onone/Example/SwiftSyntaxExample` | 12.1 ± 0.5 | 11.1 | 14.8 | 1.07 ± 0.06 |
| `build/Onone-llvm-lto/Example/SwiftSyntaxExample` | 11.6 ± 0.8 | 10.6 | 16.7 | 1.02 ± 0.08 |
| `build/Onone-swift-llvm-lto/Example/SwiftSyntaxExample` | 11.3 ± 0.4 | 10.5 | 13.0 | 1.00 |
| `build/Onone-swift-lto/Example/SwiftSyntaxExample` | 12.3 ± 0.8 | 11.1 | 15.0 | 1.09 ± 0.08 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Onone/Example/SwiftSyntaxExample` | 12.1 ± 0.5 | 11.1 | 14.8 | 1.07 ± 0.06 |
| `build/Onone-llvm-lto/Example/SwiftSyntaxExample` | 11.6 ± 0.8 | 10.6 | 16.7 | 1.02 ± 0.08 |
| `build/Onone-swift-llvm-lto/Example/SwiftSyntaxExample` | 11.3 ± 0.4 | 10.5 | 13.0 | 1.00 |
| `build/Onone-swift-lto/Example/SwiftSyntaxExample` | 12.3 ± 0.8 | 11.1 | 15.0 | 1.09 ± 0.08 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Onone/Example/SwiftSyntaxExample` | 12.1 ± 0.5 | 11.1 | 14.8 | 1.07 ± 0.06 |
| `build/Onone-llvm-lto/Example/SwiftSyntaxExample` | 11.6 ± 0.8 | 10.6 | 16.7 | 1.02 ± 0.08 |
| `build/Onone-swift-llvm-lto/Example/SwiftSyntaxExample` | 11.3 ± 0.4 | 10.5 | 13.0 | 1.00 |
| `build/Onone-swift-lto/Example/SwiftSyntaxExample` | 12.3 ± 0.8 | 11.1 | 15.0 | 1.09 ± 0.08 |



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

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Onone/Example/SwiftSyntaxExample` | 12.1 ± 0.5 | 11.1 | 14.8 | 1.07 ± 0.06 |
| `build/Onone-llvm-lto/Example/SwiftSyntaxExample` | 11.6 ± 0.8 | 10.6 | 16.7 | 1.02 ± 0.08 |
| `build/Onone-swift-llvm-lto/Example/SwiftSyntaxExample` | 11.3 ± 0.4 | 10.5 | 13.0 | 1.00 |
| `build/Onone-swift-lto/Example/SwiftSyntaxExample` | 12.3 ± 0.8 | 11.1 | 15.0 | 1.09 ± 0.08 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/O/Example/SwiftSyntaxExample` | 10.0 ± 0.6 | 9.1 | 12.1 | 1.00 |
| `build/O-llvm-lto/Example/SwiftSyntaxExample` | 35.6 ± 356.6 | 9.3 | 5015.6 | 3.57 ± 35.78 |
| `build/O-swift-llvm-lto/Example/SwiftSyntaxExample` | 10.5 ± 0.7 | 9.3 | 13.2 | 1.05 ± 0.09 |
| `build/O-swift-lto/Example/SwiftSyntaxExample` | 10.1 ± 0.5 | 9.2 | 12.7 | 1.01 ± 0.08 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Osize/Example/SwiftSyntaxExample` | 9.9 ± 0.6 | 9.0 | 13.2 | 1.00 |
| `build/Osize-llvm-lto/Example/SwiftSyntaxExample` | 10.0 ± 0.6 | 9.0 | 11.9 | 1.02 ± 0.09 |
| `build/Osize-swift-llvm-lto/Example/SwiftSyntaxExample` | 10.2 ± 0.6 | 9.1 | 12.2 | 1.03 ± 0.09 |
| `build/Osize-swift-lto/Example/SwiftSyntaxExample` | 9.9 ± 0.3 | 9.2 | 11.4 | 1.00 ± 0.07 |



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

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Onone/Example/RxSwiftExample` | 8.8 ± 0.4 | 8.1 | 11.2 | 1.00 |
| `build/Onone-llvm-lto/Example/RxSwiftExample` | 9.2 ± 0.6 | 8.2 | 11.2 | 1.04 ± 0.08 |
| `build/Onone-swift-llvm-lto/Example/RxSwiftExample` | 9.1 ± 0.6 | 8.2 | 11.0 | 1.03 ± 0.08 |
| `build/Onone-swift-lto/Example/RxSwiftExample` | 8.9 ± 0.4 | 8.1 | 10.7 | 1.01 ± 0.06 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/O/Example/RxSwiftExample` | 8.8 ± 0.6 | 7.9 | 11.2 | 1.02 ± 0.08 |
| `build/O-llvm-lto/Example/RxSwiftExample` | 8.9 ± 0.6 | 7.9 | 11.1 | 1.04 ± 0.09 |
| `build/O-swift-llvm-lto/Example/RxSwiftExample` | 9.0 ± 0.6 | 8.0 | 10.9 | 1.05 ± 0.08 |
| `build/O-swift-lto/Example/RxSwiftExample` | 8.6 ± 0.4 | 8.0 | 10.0 | 1.00 |


| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `build/Osize/Example/RxSwiftExample` | 8.7 ± 0.6 | 7.8 | 10.7 | 1.00 ± 0.08 |
| `build/Osize-llvm-lto/Example/RxSwiftExample` | 8.7 ± 0.4 | 7.9 | 9.8 | 1.00 |
| `build/Osize-swift-llvm-lto/Example/RxSwiftExample` | 8.9 ± 0.6 | 7.9 | 10.9 | 1.03 ± 0.08 |
| `build/Osize-swift-lto/Example/RxSwiftExample` | 8.7 ± 0.4 | 7.8 | 10.9 | 1.00 ± 0.06 |
