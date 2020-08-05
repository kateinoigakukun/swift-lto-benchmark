# swift-lto-benchmark

## Build

```sh
$ ./utils/build-script path/to/swiftc
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
    <td>6.6 MB</td>
    <td>6.8 MB</td>
    <td>4.8 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>7.4 MB</td>
    <td>4.7 MB</td>
    <td>7.4 MB</td>
    <td>4.3 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>7.0 MB</td>
    <td>4.5 MB</td>
    <td>6.8 MB</td>
    <td>4.0 MB</td>
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
    <td>39.70 s</td>
    <td>33.14 s</td>
    <td>101.92 s</td>
    <td>71.33 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>258.85 s</td>
    <td>205.19 s</td>
    <td>63.56 s</td>
    <td>211.61 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>192.92 s</td>
    <td>145.03 s</td>
    <td>40.06 s</td>
    <td>126.44 s</td>
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
  <td>0.5</td>
    <td>4.2</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>253952</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>0.5</td>
    <td>4.0</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>258048</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>0.5</td>
    <td>4.1</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>237568</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>0.5</td>
    <td>4.2</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>212992</td>
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
  <td>0.5</td>
    <td>4.5</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>253952</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>0.5</td>
    <td>4.5</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>266240</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>0.5</td>
    <td>4.3</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>245760</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>0.5</td>
    <td>4.1</td>
    <td>1.0</td>
    <td>0.0</td>
    <td>0.5</td>
    <td>241664</td>
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
    <td>307.0 KB</td>
    <td>273.5 KB</td>
    <td>250.7 KB</td>
    <td>202.8 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>309.9 KB</td>
    <td>275.9 KB</td>
    <td>299.3 KB</td>
    <td>233.2 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>277.8 KB</td>
    <td>243.3 KB</td>
    <td>251.9 KB</td>
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
    <td>16.54 s</td>
    <td>19.05 s</td>
    <td>22.31 s</td>
    <td>22.80 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>38.49 s</td>
    <td>36.15 s</td>
    <td>42.25 s</td>
    <td>43.76 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>16.19 s</td>
    <td>17.15 s</td>
    <td>18.18 s</td>
    <td>16.71 s</td>
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
  <td>52.1</td>
    <td>61.9</td>
    <td>56.0</td>
    <td>2.0</td>
    <td>55.4</td>
    <td>4022272</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>63.2</td>
    <td>95.2</td>
    <td>67.0</td>
    <td>4.0</td>
    <td>66.1</td>
    <td>4952064</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.5</td>
    <td>77.8</td>
    <td>67.0</td>
    <td>2.0</td>
    <td>66.5</td>
    <td>7880704</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.6</td>
    <td>84.2</td>
    <td>68.0</td>
    <td>3.0</td>
    <td>67.7</td>
    <td>8007680</td>
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
  <td>34.9</td>
    <td>45.6</td>
    <td>38.0</td>
    <td>2.0</td>
    <td>37.5</td>
    <td>4087808</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>42.4</td>
    <td>54.1</td>
    <td>46.0</td>
    <td>2.0</td>
    <td>45.4</td>
    <td>4902912</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>44.7</td>
    <td>55.5</td>
    <td>49.0</td>
    <td>2.0</td>
    <td>48.2</td>
    <td>7860224</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>44.5</td>
    <td>53.4</td>
    <td>48.0</td>
    <td>2.0</td>
    <td>47.5</td>
    <td>7884800</td>
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
  <td>37.6</td>
    <td>47.0</td>
    <td>41.0</td>
    <td>1.0</td>
    <td>40.4</td>
    <td>4014080</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>43.3</td>
    <td>58.6</td>
    <td>47.0</td>
    <td>2.0</td>
    <td>46.8</td>
    <td>4857856</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>49.0</td>
    <td>59.8</td>
    <td>52.0</td>
    <td>2.0</td>
    <td>52.0</td>
    <td>7901184</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>49.3</td>
    <td>59.8</td>
    <td>53.0</td>
    <td>2.0</td>
    <td>52.5</td>
    <td>7794688</td>
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
    <td>10.4 MB</td>
    <td>8.2 MB</td>
    <td>5.6 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>6.9 MB</td>
    <td>5.4 MB</td>
    <td>6.9 MB</td>
    <td>4.5 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>5.6 MB</td>
    <td>4.5 MB</td>
    <td>5.3 MB</td>
    <td>3.5 MB</td>
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
    <td>223.35 s</td>
    <td>194.52 s</td>
    <td>340.84 s</td>
    <td>275.10 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>723.84 s</td>
    <td>666.75 s</td>
    <td>732.82 s</td>
    <td>678.54 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>525.09 s</td>
    <td>469.49 s</td>
    <td>476.35 s</td>
    <td>398.39 s</td>
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
  <td>467.3</td>
    <td>520.9</td>
    <td>484.0</td>
    <td>10.0</td>
    <td>481.1</td>
    <td>2105344</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>427.1</td>
    <td>479.7</td>
    <td>438.0</td>
    <td>10.0</td>
    <td>435.6</td>
    <td>3219456</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>346.7</td>
    <td>392.3</td>
    <td>358.0</td>
    <td>8.0</td>
    <td>357.1</td>
    <td>1523712</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>341.5</td>
    <td>384.3</td>
    <td>354.0</td>
    <td>10.0</td>
    <td>350.6</td>
    <td>1544192</td>
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
  <td>65.9</td>
    <td>76.3</td>
    <td>70.0</td>
    <td>2.0</td>
    <td>69.4</td>
    <td>1179648</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>74.5</td>
    <td>83.0</td>
    <td>77.0</td>
    <td>2.0</td>
    <td>76.9</td>
    <td>1425408</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>66.2</td>
    <td>76.1</td>
    <td>70.0</td>
    <td>2.0</td>
    <td>69.7</td>
    <td>1081344</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>66.1</td>
    <td>74.5</td>
    <td>69.0</td>
    <td>2.0</td>
    <td>68.7</td>
    <td>1032192</td>
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
  <td>67.8</td>
    <td>81.5</td>
    <td>72.0</td>
    <td>3.0</td>
    <td>71.1</td>
    <td>1142784</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>75.1</td>
    <td>97.4</td>
    <td>80.0</td>
    <td>4.0</td>
    <td>79.6</td>
    <td>1830912</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>66.7</td>
    <td>79.4</td>
    <td>70.0</td>
    <td>3.0</td>
    <td>69.3</td>
    <td>1126400</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>66.5</td>
    <td>79.8</td>
    <td>70.0</td>
    <td>3.0</td>
    <td>69.6</td>
    <td>1089536</td>
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
    <td>291.9 KB</td>
    <td>173.8 KB</td>
    <td>239.9 KB</td>
    <td>114.3 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>204.2 KB</td>
    <td>138.7 KB</td>
    <td>201.9 KB</td>
    <td>110.9 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>188.5 KB</td>
    <td>138.7 KB</td>
    <td>186.7 KB</td>
    <td>111.1 KB</td>
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
    <td>4.02 s</td>
    <td>3.50 s</td>
    <td>6.70 s</td>
    <td>4.64 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>5.32 s</td>
    <td>4.39 s</td>
    <td>4.60 s</td>
    <td>5.34 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>3.12 s</td>
    <td>2.47 s</td>
    <td>2.52 s</td>
    <td>2.50 s</td>
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
  <td>0.1</td>
    <td>0.8</td>
    <td>0.0</td>
    <td>0.0</td>
    <td>0.1</td>
    <td>229376</td>
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
  <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
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

<table>
<tr><td colspan=7>Osize</td></tr>
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
    <td>1.9 MB</td>
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
    <td>1.4 MB</td>
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
    <td>55.99 s</td>
    <td>56.17 s</td>
    <td>79.44 s</td>
    <td>74.57 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>110.06 s</td>
    <td>103.47 s</td>
    <td>117.51 s</td>
    <td>110.89 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>67.49 s</td>
    <td>60.75 s</td>
    <td>64.15 s</td>
    <td>56.89 s</td>
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
  <td>75.4</td>
    <td>89.9</td>
    <td>80.0</td>
    <td>2.0</td>
    <td>79.4</td>
    <td>688128</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>69.5</td>
    <td>84.3</td>
    <td>74.0</td>
    <td>2.0</td>
    <td>73.6</td>
    <td>1294336</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>74.6</td>
    <td>91.8</td>
    <td>79.0</td>
    <td>3.0</td>
    <td>77.6</td>
    <td>417792</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>74.0</td>
    <td>85.2</td>
    <td>78.0</td>
    <td>2.0</td>
    <td>78.0</td>
    <td>405504</td>
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
  <td>37.5</td>
    <td>48.8</td>
    <td>40.0</td>
    <td>1.0</td>
    <td>40.1</td>
    <td>577536</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>38.4</td>
    <td>54.1</td>
    <td>41.0</td>
    <td>2.0</td>
    <td>40.4</td>
    <td>1216512</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>41.3</td>
    <td>50.2</td>
    <td>44.0</td>
    <td>1.0</td>
    <td>44.1</td>
    <td>446464</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>40.6</td>
    <td>50.6</td>
    <td>44.0</td>
    <td>2.0</td>
    <td>43.6</td>
    <td>491520</td>
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
  <td>37.8</td>
    <td>47.7</td>
    <td>40.0</td>
    <td>1.0</td>
    <td>39.9</td>
    <td>561152</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>37.7</td>
    <td>49.9</td>
    <td>40.0</td>
    <td>2.0</td>
    <td>40.3</td>
    <td>1241088</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>41.7</td>
    <td>52.0</td>
    <td>45.0</td>
    <td>2.0</td>
    <td>44.8</td>
    <td>581632</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>41.8</td>
    <td>52.1</td>
    <td>44.0</td>
    <td>2.0</td>
    <td>44.0</td>
    <td>475136</td>
</tr>
</table>


