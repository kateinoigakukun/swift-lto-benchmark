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
    <td>6.1 MB</td>
    <td>6.8 MB</td>
    <td>4.5 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>7.5 MB</td>
    <td>4.4 MB</td>
    <td>7.4 MB</td>
    <td>4.0 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>7.0 MB</td>
    <td>4.2 MB</td>
    <td>6.8 MB</td>
    <td>3.8 MB</td>
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
    <td>22.16 s</td>
    <td>17.61 s</td>
    <td>54.77 s</td>
    <td>36.44 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>188.43 s</td>
    <td>118.46 s</td>
    <td>42.72 s</td>
    <td>113.31 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>138.40 s</td>
    <td>91.28 s</td>
    <td>36.72 s</td>
    <td>91.00 s</td>
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
  <td>1511.3</td>
    <td>1827.9</td>
    <td>1560.0</td>
    <td>58.0</td>
    <td>1534.3</td>
    <td>2912256</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1540.9</td>
    <td>1729.9</td>
    <td>1614.0</td>
    <td>40.0</td>
    <td>1606.5</td>
    <td>3489792</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1500.2</td>
    <td>1870.0</td>
    <td>1572.0</td>
    <td>58.0</td>
    <td>1558.6</td>
    <td>3690496</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1501.3</td>
    <td>1714.8</td>
    <td>1550.0</td>
    <td>44.0</td>
    <td>1537.1</td>
    <td>3268608</td>
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
  <td>1646.6</td>
    <td>1819.1</td>
    <td>1698.0</td>
    <td>31.0</td>
    <td>1693.6</td>
    <td>3153920</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1633.8</td>
    <td>1839.0</td>
    <td>1689.0</td>
    <td>34.0</td>
    <td>1681.4</td>
    <td>2572288</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1654.1</td>
    <td>1730.5</td>
    <td>1678.0</td>
    <td>18.0</td>
    <td>1671.7</td>
    <td>2183168</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1631.0</td>
    <td>1806.1</td>
    <td>1691.0</td>
    <td>35.0</td>
    <td>1684.2</td>
    <td>3129344</td>
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
    <td>7.23 s</td>
    <td>8.45 s</td>
    <td>11.43 s</td>
    <td>9.39 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>22.24 s</td>
    <td>10.41 s</td>
    <td>13.72 s</td>
    <td>13.22 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>12.10 s</td>
    <td>8.25 s</td>
    <td>11.20 s</td>
    <td>9.34 s</td>
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
  <td>61.0</td>
    <td>125.8</td>
    <td>66.0</td>
    <td>7.0</td>
    <td>64.4</td>
    <td>4763648</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>59.0</td>
    <td>72.0</td>
    <td>61.0</td>
    <td>2.0</td>
    <td>60.2</td>
    <td>4648960</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>60.1</td>
    <td>68.8</td>
    <td>62.0</td>
    <td>2.0</td>
    <td>61.7</td>
    <td>7708672</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>59.7</td>
    <td>69.5</td>
    <td>62.0</td>
    <td>2.0</td>
    <td>62.1</td>
    <td>7405568</td>
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
  <td>40.2</td>
    <td>48.5</td>
    <td>42.0</td>
    <td>1.0</td>
    <td>41.6</td>
    <td>4751360</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>41.7</td>
    <td>50.6</td>
    <td>44.0</td>
    <td>1.0</td>
    <td>43.4</td>
    <td>4640768</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>44.3</td>
    <td>51.9</td>
    <td>47.0</td>
    <td>1.0</td>
    <td>46.3</td>
    <td>7540736</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>43.8</td>
    <td>52.7</td>
    <td>46.0</td>
    <td>2.0</td>
    <td>46.0</td>
    <td>7643136</td>
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
  <td>40.9</td>
    <td>51.9</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>43.3</td>
    <td>4825088</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>43.0</td>
    <td>52.1</td>
    <td>46.0</td>
    <td>2.0</td>
    <td>45.7</td>
    <td>4804608</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>47.0</td>
    <td>103.7</td>
    <td>50.0</td>
    <td>6.0</td>
    <td>49.1</td>
    <td>7745536</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>46.4</td>
    <td>110.1</td>
    <td>50.0</td>
    <td>7.0</td>
    <td>48.9</td>
    <td>7688192</td>
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
    <td>4.4 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>5.6 MB</td>
    <td>4.4 MB</td>
    <td>5.3 MB</td>
    <td>3.3 MB</td>
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
    <td>120.97 s</td>
    <td>106.10 s</td>
    <td>197.96 s</td>
    <td>153.60 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>497.54 s</td>
    <td>392.27 s</td>
    <td>475.34 s</td>
    <td>394.30 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>375.92 s</td>
    <td>286.28 s</td>
    <td>318.45 s</td>
    <td>267.69 s</td>
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
  <td>444.2</td>
    <td>567.9</td>
    <td>473.0</td>
    <td>28.0</td>
    <td>463.7</td>
    <td>3219456</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>404.9</td>
    <td>519.8</td>
    <td>428.0</td>
    <td>16.0</td>
    <td>424.6</td>
    <td>3457024</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>326.1</td>
    <td>390.7</td>
    <td>342.0</td>
    <td>9.0</td>
    <td>341.1</td>
    <td>1789952</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>326.6</td>
    <td>394.5</td>
    <td>342.0</td>
    <td>13.0</td>
    <td>338.5</td>
    <td>1757184</td>
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
  <td>71.0</td>
    <td>86.8</td>
    <td>75.0</td>
    <td>3.0</td>
    <td>74.3</td>
    <td>1515520</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>71.1</td>
    <td>91.8</td>
    <td>76.0</td>
    <td>4.0</td>
    <td>75.3</td>
    <td>2015232</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.4</td>
    <td>79.1</td>
    <td>68.0</td>
    <td>3.0</td>
    <td>67.7</td>
    <td>1159168</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.3</td>
    <td>77.8</td>
    <td>67.0</td>
    <td>3.0</td>
    <td>66.1</td>
    <td>1122304</td>
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
  <td>73.6</td>
    <td>104.2</td>
    <td>79.0</td>
    <td>5.0</td>
    <td>78.1</td>
    <td>1888256</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>73.9</td>
    <td>91.4</td>
    <td>81.0</td>
    <td>4.0</td>
    <td>80.3</td>
    <td>1794048</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.5</td>
    <td>84.3</td>
    <td>69.0</td>
    <td>4.0</td>
    <td>68.6</td>
    <td>1208320</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.9</td>
    <td>75.0</td>
    <td>69.0</td>
    <td>3.0</td>
    <td>68.4</td>
    <td>1183744</td>
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
    <td>1.20 s</td>
    <td>1.54 s</td>
    <td>3.26 s</td>
    <td>3.02 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>4.31 s</td>
    <td>1.46 s</td>
    <td>1.70 s</td>
    <td>1.73 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>1.99 s</td>
    <td>1.32 s</td>
    <td>1.60 s</td>
    <td>1.44 s</td>
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
    <td>1.2</td>
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
    <td>1.7 MB</td>
    <td>1.4 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>1.6 MB</td>
    <td>1.4 MB</td>
    <td>1.5 MB</td>
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
    <td>31.47 s</td>
    <td>28.57 s</td>
    <td>44.08 s</td>
    <td>39.85 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>62.42 s</td>
    <td>38.49 s</td>
    <td>48.80 s</td>
    <td>44.05 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>41.77 s</td>
    <td>32.88 s</td>
    <td>35.34 s</td>
    <td>32.62 s</td>
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
  <td>70.2</td>
    <td>88.2</td>
    <td>75.0</td>
    <td>3.0</td>
    <td>74.8</td>
    <td>1224704</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>67.2</td>
    <td>86.5</td>
    <td>71.0</td>
    <td>3.0</td>
    <td>71.0</td>
    <td>1294336</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>71.7</td>
    <td>88.4</td>
    <td>77.0</td>
    <td>3.0</td>
    <td>77.0</td>
    <td>454656</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>72.1</td>
    <td>82.3</td>
    <td>76.0</td>
    <td>2.0</td>
    <td>75.6</td>
    <td>385024</td>
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
  <td>36.3</td>
    <td>50.3</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>39.0</td>
    <td>1171456</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>36.5</td>
    <td>47.7</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>38.9</td>
    <td>1216512</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.4</td>
    <td>48.4</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.6</td>
    <td>454656</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>40.3</td>
    <td>56.7</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>43.2</td>
    <td>462848</td>
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
    <td>52.9</td>
    <td>41.0</td>
    <td>2.0</td>
    <td>40.3</td>
    <td>1179648</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>37.2</td>
    <td>51.7</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>38.8</td>
    <td>1200128</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.3</td>
    <td>49.9</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.6</td>
    <td>524288</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>39.8</td>
    <td>50.4</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.1</td>
    <td>475136</td>
</tr>
</table>


