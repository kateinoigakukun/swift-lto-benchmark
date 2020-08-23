# swift-lto-benchmark

## Build

```sh
$ ./utils/build-all.py path/to/swiftc
```


## Result

### SwiftStdlib
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
    <td>10.0 MB</td>
    <td>4.7 MB</td>
    <td>6.8 MB</td>
    <td>3.5 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>7.5 MB</td>
    <td>3.5 MB</td>
    <td>7.4 MB</td>
    <td>3.0 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>7.0 MB</td>
    <td>3.4 MB</td>
    <td>6.8 MB</td>
    <td>2.9 MB</td>
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
    <td>35.19 s</td>
    <td>22.11 s</td>
    <td>94.92 s</td>
    <td>39.80 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>240.72 s</td>
    <td>163.29 s</td>
    <td>63.66 s</td>
    <td>169.06 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>180.69 s</td>
    <td>115.83 s</td>
    <td>41.05 s</td>
    <td>103.69 s</td>
</tr>
</table>

#### Runtime Performance
<table>
<tr><td colspan=7>Onone</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>O</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>1520.3</td>
    <td>1631.5</td>
    <td>1548.0</td>
    <td>20.0</td>
    <td>1542.6</td>
    <td>2412544</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1519.6</td>
    <td>1812.6</td>
    <td>1599.0</td>
    <td>53.0</td>
    <td>1594.5</td>
    <td>3112960</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1479.4</td>
    <td>1655.6</td>
    <td>1546.0</td>
    <td>41.0</td>
    <td>1534.2</td>
    <td>2605056</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1457.1</td>
    <td>1678.4</td>
    <td>1523.0</td>
    <td>42.0</td>
    <td>1517.2</td>
    <td>2854912</td>
</tr>
</table>

<table>
<tr><td colspan=7>Osize</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>1629.3</td>
    <td>1851.6</td>
    <td>1686.0</td>
    <td>40.0</td>
    <td>1679.8</td>
    <td>3575808</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1624.4</td>
    <td>1801.3</td>
    <td>1684.0</td>
    <td>33.0</td>
    <td>1682.1</td>
    <td>2449408</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1608.1</td>
    <td>1724.7</td>
    <td>1644.0</td>
    <td>26.0</td>
    <td>1635.2</td>
    <td>2351104</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1573.9</td>
    <td>1801.3</td>
    <td>1617.0</td>
    <td>38.0</td>
    <td>1605.6</td>
    <td>2973696</td>
</tr>
</table>


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
    <td>309.4 KB</td>
    <td>261.5 KB</td>
    <td>215.7 KB</td>
    <td>172.7 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>312.2 KB</td>
    <td>255.9 KB</td>
    <td>264.2 KB</td>
    <td>199.0 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>272.1 KB</td>
    <td>231.4 KB</td>
    <td>224.8 KB</td>
    <td>176.8 KB</td>
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
    <td>17.06 s</td>
    <td>19.74 s</td>
    <td>20.81 s</td>
    <td>22.03 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>42.64 s</td>
    <td>39.41 s</td>
    <td>36.82 s</td>
    <td>40.49 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>15.08 s</td>
    <td>16.22 s</td>
    <td>19.53 s</td>
    <td>15.11 s</td>
</tr>
</table>

#### Runtime Performance
<table>
<tr><td colspan=7>Onone</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>61.3</td>
    <td>70.1</td>
    <td>63.0</td>
    <td>2.0</td>
    <td>62.7</td>
    <td>4608000</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>60.1</td>
    <td>68.2</td>
    <td>62.0</td>
    <td>1.0</td>
    <td>61.1</td>
    <td>4644864</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>60.2</td>
    <td>68.7</td>
    <td>63.0</td>
    <td>2.0</td>
    <td>62.6</td>
    <td>7712768</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>59.6</td>
    <td>68.2</td>
    <td>62.0</td>
    <td>2.0</td>
    <td>62.0</td>
    <td>7569408</td>
</tr>
</table>

<table>
<tr><td colspan=7>O</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>40.9</td>
    <td>51.4</td>
    <td>42.0</td>
    <td>1.0</td>
    <td>41.4</td>
    <td>4788224</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>40.4</td>
    <td>49.4</td>
    <td>42.0</td>
    <td>1.0</td>
    <td>41.1</td>
    <td>4755456</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>43.6</td>
    <td>51.3</td>
    <td>45.0</td>
    <td>2.0</td>
    <td>44.6</td>
    <td>7532544</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>43.7</td>
    <td>51.0</td>
    <td>45.0</td>
    <td>1.0</td>
    <td>45.0</td>
    <td>7483392</td>
</tr>
</table>

<table>
<tr><td colspan=7>Osize</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>45.1</td>
    <td>53.3</td>
    <td>46.0</td>
    <td>1.0</td>
    <td>46.0</td>
    <td>4632576</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>42.2</td>
    <td>53.7</td>
    <td>45.0</td>
    <td>2.0</td>
    <td>44.3</td>
    <td>4837376</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>46.9</td>
    <td>59.9</td>
    <td>51.0</td>
    <td>3.0</td>
    <td>50.3</td>
    <td>7692288</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>47.0</td>
    <td>54.8</td>
    <td>49.0</td>
    <td>1.0</td>
    <td>48.6</td>
    <td>7458816</td>
</tr>
</table>


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
    <td>9.0 MB</td>
    <td>8.2 MB</td>
    <td>5.0 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>6.9 MB</td>
    <td>5.3 MB</td>
    <td>6.9 MB</td>
    <td>4.3 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>5.6 MB</td>
    <td>4.4 MB</td>
    <td>5.3 MB</td>
    <td>3.2 MB</td>
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
    <td>202.37 s</td>
    <td>173.35 s</td>
    <td>317.36 s</td>
    <td>231.66 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>673.78 s</td>
    <td>621.05 s</td>
    <td>680.40 s</td>
    <td>627.12 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>491.27 s</td>
    <td>438.24 s</td>
    <td>456.80 s</td>
    <td>368.33 s</td>
</tr>
</table>

#### Runtime Performance
<table>
<tr><td colspan=7>Onone</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>446.8</td>
    <td>494.3</td>
    <td>456.0</td>
    <td>8.0</td>
    <td>453.5</td>
    <td>2732032</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>324.0</td>
    <td>375.0</td>
    <td>334.0</td>
    <td>9.0</td>
    <td>331.3</td>
    <td>1433600</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>O</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>70.6</td>
    <td>90.9</td>
    <td>75.0</td>
    <td>4.0</td>
    <td>73.3</td>
    <td>1646592</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>71.3</td>
    <td>80.0</td>
    <td>73.0</td>
    <td>2.0</td>
    <td>73.0</td>
    <td>1404928</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.1</td>
    <td>71.3</td>
    <td>66.0</td>
    <td>2.0</td>
    <td>65.4</td>
    <td>958464</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.1</td>
    <td>72.0</td>
    <td>66.0</td>
    <td>2.0</td>
    <td>65.6</td>
    <td>950272</td>
</tr>
</table>

<table>
<tr><td colspan=7>Osize</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>72.9</td>
    <td>82.4</td>
    <td>75.0</td>
    <td>2.0</td>
    <td>74.1</td>
    <td>1314816</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>73.2</td>
    <td>86.9</td>
    <td>75.0</td>
    <td>2.0</td>
    <td>74.2</td>
    <td>1769472</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.6</td>
    <td>72.0</td>
    <td>65.0</td>
    <td>2.0</td>
    <td>65.0</td>
    <td>1056768</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>64.4</td>
    <td>72.0</td>
    <td>66.0</td>
    <td>1.0</td>
    <td>65.4</td>
    <td>811008</td>
</tr>
</table>


### SwiftNumerics
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
    <td>294.4 KB</td>
    <td>165.9 KB</td>
    <td>204.9 KB</td>
    <td>92.3 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>202.9 KB</td>
    <td>130.7 KB</td>
    <td>170.9 KB</td>
    <td>76.8 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>199.2 KB</td>
    <td>130.7 KB</td>
    <td>163.6 KB</td>
    <td>77.1 KB</td>
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
    <td>2.79 s</td>
    <td>1.73 s</td>
    <td>5.66 s</td>
    <td>3.15 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>4.83 s</td>
    <td>4.45 s</td>
    <td>4.55 s</td>
    <td>4.29 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>2.35 s</td>
    <td>2.31 s</td>
    <td>2.34 s</td>
    <td>2.47 s</td>
</tr>
</table>

#### Runtime Performance
<table>
<tr><td colspan=7>Onone</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>0.1</td>
    <td>0.5</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.1</td>
    <td>237568</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>0.1</td>
    <td>0.6</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.1</td>
    <td>233472</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>O</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>274432</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>270336</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>Osize</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>278528</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>274432</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>


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
    <td>2.7 MB</td>
    <td>1.0 MB</td>
    <td>1.7 MB</td>
    <td>783.1 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>1.6 MB</td>
    <td>864.0 KB</td>
    <td>1.5 MB</td>
    <td>740.0 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>1.5 MB</td>
    <td>848.0 KB</td>
    <td>1.4 MB</td>
    <td>712.4 KB</td>
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
    <td>57.99 s</td>
    <td>48.06 s</td>
    <td>72.09 s</td>
    <td>54.50 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>106.45 s</td>
    <td>76.70 s</td>
    <td>106.57 s</td>
    <td>79.31 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>63.63 s</td>
    <td>45.74 s</td>
    <td>63.42 s</td>
    <td>38.96 s</td>
</tr>
</table>

#### Runtime Performance
<table>
<tr><td colspan=7>Onone</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>69.1</td>
    <td>87.2</td>
    <td>73.0</td>
    <td>3.0</td>
    <td>72.8</td>
    <td>1126400</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>71.4</td>
    <td>84.3</td>
    <td>75.0</td>
    <td>2.0</td>
    <td>74.2</td>
    <td>372736</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>O</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>37.3</td>
    <td>51.4</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>38.1</td>
    <td>1122304</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.9</td>
    <td>49.1</td>
    <td>44.0</td>
    <td>2.0</td>
    <td>44.1</td>
    <td>520192</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>

<table>
<tr><td colspan=7>Osize</td></tr>
<tr>
  <td>Variant</td>
  <td>MIN</td><td>MAX</td><td>MEAN</td><td>SD</td><td>MEDIAN</td><td>MAX_RSS(B)</td>
</tr>
<tr>
  <td>non-LTO</td>
  <td>37.3</td>
    <td>51.0</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>38.6</td>
    <td>1138688</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.1</td>
    <td>47.3</td>
    <td>42.0</td>
    <td>2.0</td>
    <td>41.5</td>
    <td>524288</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
</table>


