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
    <td>6.3 MB</td>
    <td>6.8 MB</td>
    <td>4.6 MB</td>
</tr>
<tr>
    <td>O</td>
    <td>7.4 MB</td>
    <td>4.5 MB</td>
    <td>7.4 MB</td>
    <td>4.1 MB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>7.0 MB</td>
    <td>4.4 MB</td>
    <td>6.8 MB</td>
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
    <td>34.69 s</td>
    <td>28.80 s</td>
    <td>90.36 s</td>
    <td>60.34 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>232.39 s</td>
    <td>179.90 s</td>
    <td>60.02 s</td>
    <td>186.14 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>173.40 s</td>
    <td>129.79 s</td>
    <td>39.26 s</td>
    <td>113.32 s</td>
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
  <td>1544.9</td>
    <td>1696.8</td>
    <td>1571.0</td>
    <td>22.0</td>
    <td>1564.6</td>
    <td>2600960</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1526.9</td>
    <td>1608.5</td>
    <td>1552.0</td>
    <td>14.0</td>
    <td>1550.3</td>
    <td>2924544</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1501.7</td>
    <td>1606.0</td>
    <td>1531.0</td>
    <td>18.0</td>
    <td>1527.8</td>
    <td>2277376</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1491.9</td>
    <td>1621.6</td>
    <td>1515.0</td>
    <td>17.0</td>
    <td>1512.2</td>
    <td>2392064</td>
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
  <td>1657.2</td>
    <td>1735.5</td>
    <td>1685.0</td>
    <td>15.0</td>
    <td>1684.2</td>
    <td>2637824</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>1655.0</td>
    <td>1744.5</td>
    <td>1677.0</td>
    <td>15.0</td>
    <td>1673.7</td>
    <td>2592768</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>1628.5</td>
    <td>1727.9</td>
    <td>1656.0</td>
    <td>15.0</td>
    <td>1653.4</td>
    <td>2334720</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>1608.2</td>
    <td>1678.9</td>
    <td>1634.0</td>
    <td>13.0</td>
    <td>1631.0</td>
    <td>2502656</td>
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
    <td>275.0 KB</td>
    <td>261.5 KB</td>
    <td>214.7 KB</td>
    <td>170.8 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>277.8 KB</td>
    <td>255.9 KB</td>
    <td>263.3 KB</td>
    <td>197.2 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>241.8 KB</td>
    <td>231.4 KB</td>
    <td>223.9 KB</td>
    <td>175.0 KB</td>
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
    <td>16.76 s</td>
    <td>20.80 s</td>
    <td>22.98 s</td>
    <td>22.71 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>33.69 s</td>
    <td>39.77 s</td>
    <td>37.51 s</td>
    <td>40.10 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>14.43 s</td>
    <td>15.35 s</td>
    <td>16.10 s</td>
    <td>15.25 s</td>
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
  <td>50.2</td>
    <td>61.3</td>
    <td>52.0</td>
    <td>2.0</td>
    <td>52.2</td>
    <td>3993600</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>61.7</td>
    <td>89.3</td>
    <td>65.0</td>
    <td>3.0</td>
    <td>64.4</td>
    <td>4775936</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>60.1</td>
    <td>70.0</td>
    <td>64.0</td>
    <td>2.0</td>
    <td>63.2</td>
    <td>7602176</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>60.2</td>
    <td>73.2</td>
    <td>64.0</td>
    <td>2.0</td>
    <td>63.4</td>
    <td>7737344</td>
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
  <td>34.3</td>
    <td>40.9</td>
    <td>36.0</td>
    <td>1.0</td>
    <td>35.7</td>
    <td>4046848</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>41.2</td>
    <td>51.9</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.9</td>
    <td>4759552</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>43.3</td>
    <td>50.5</td>
    <td>46.0</td>
    <td>2.0</td>
    <td>45.8</td>
    <td>7798784</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>43.7</td>
    <td>51.1</td>
    <td>46.0</td>
    <td>1.0</td>
    <td>45.9</td>
    <td>7475200</td>
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
  <td>35.9</td>
    <td>42.9</td>
    <td>38.0</td>
    <td>1.0</td>
    <td>37.8</td>
    <td>4001792</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>41.7</td>
    <td>52.1</td>
    <td>44.0</td>
    <td>2.0</td>
    <td>43.4</td>
    <td>4866048</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>46.7</td>
    <td>57.8</td>
    <td>49.0</td>
    <td>2.0</td>
    <td>49.2</td>
    <td>7868416</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>47.4</td>
    <td>56.6</td>
    <td>50.0</td>
    <td>2.0</td>
    <td>50.0</td>
    <td>7651328</td>
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
    <td>6.8 MB</td>
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
    <td>199.00 s</td>
    <td>178.24 s</td>
    <td>307.41 s</td>
    <td>247.95 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>656.39 s</td>
    <td>605.61 s</td>
    <td>661.79 s</td>
    <td>608.35 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>473.17 s</td>
    <td>424.89 s</td>
    <td>431.92 s</td>
    <td>361.39 s</td>
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
  <td>448.3</td>
    <td>519.6</td>
    <td>461.0</td>
    <td>13.0</td>
    <td>456.2</td>
    <td>2076672</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>408.5</td>
    <td>444.6</td>
    <td>416.0</td>
    <td>6.0</td>
    <td>415.1</td>
    <td>3117056</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>328.8</td>
    <td>363.5</td>
    <td>338.0</td>
    <td>6.0</td>
    <td>336.3</td>
    <td>1605632</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>326.6</td>
    <td>350.8</td>
    <td>336.0</td>
    <td>6.0</td>
    <td>335.2</td>
    <td>1830912</td>
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
  <td>64.4</td>
    <td>75.2</td>
    <td>68.0</td>
    <td>2.0</td>
    <td>67.4</td>
    <td>995328</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>71.2</td>
    <td>82.7</td>
    <td>75.0</td>
    <td>2.0</td>
    <td>75.0</td>
    <td>1556480</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.4</td>
    <td>73.7</td>
    <td>66.0</td>
    <td>2.0</td>
    <td>65.8</td>
    <td>1150976</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.2</td>
    <td>72.9</td>
    <td>66.0</td>
    <td>2.0</td>
    <td>65.4</td>
    <td>1052672</td>
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
  <td>64.5</td>
    <td>74.3</td>
    <td>67.0</td>
    <td>2.0</td>
    <td>67.3</td>
    <td>1175552</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>73.9</td>
    <td>85.5</td>
    <td>77.0</td>
    <td>2.0</td>
    <td>76.7</td>
    <td>1622016</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>63.9</td>
    <td>75.0</td>
    <td>67.0</td>
    <td>2.0</td>
    <td>66.7</td>
    <td>995328</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>63.9</td>
    <td>77.7</td>
    <td>67.0</td>
    <td>3.0</td>
    <td>66.7</td>
    <td>1122304</td>
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
    <td>259.9 KB</td>
    <td>165.9 KB</td>
    <td>203.9 KB</td>
    <td>90.3 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>168.2 KB</td>
    <td>130.7 KB</td>
    <td>169.9 KB</td>
    <td>74.8 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>164.5 KB</td>
    <td>130.7 KB</td>
    <td>162.7 KB</td>
    <td>75.1 KB</td>
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
    <td>2.09 s</td>
    <td>1.89 s</td>
    <td>5.75 s</td>
    <td>3.42 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>5.04 s</td>
    <td>4.60 s</td>
    <td>4.69 s</td>
    <td>4.62 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>2.26 s</td>
    <td>2.09 s</td>
    <td>2.26 s</td>
    <td>2.40 s</td>
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
    <td>1.1</td>
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
    <td>1.4 MB</td>
    <td>1.3 MB</td>
    <td>1.4 MB</td>
    <td>1.1 MB</td>
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
    <td>50.84 s</td>
    <td>54.44 s</td>
    <td>71.73 s</td>
    <td>69.62 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>99.82 s</td>
    <td>99.30 s</td>
    <td>106.89 s</td>
    <td>103.21 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>60.65 s</td>
    <td>55.21 s</td>
    <td>56.99 s</td>
    <td>51.42 s</td>
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
  <td>74.0</td>
    <td>92.6</td>
    <td>78.0</td>
    <td>4.0</td>
    <td>76.7</td>
    <td>667648</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>65.9</td>
    <td>78.7</td>
    <td>69.0</td>
    <td>2.0</td>
    <td>69.1</td>
    <td>1302528</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>71.0</td>
    <td>79.9</td>
    <td>75.0</td>
    <td>2.0</td>
    <td>74.2</td>
    <td>417792</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>70.8</td>
    <td>80.7</td>
    <td>73.0</td>
    <td>2.0</td>
    <td>73.1</td>
    <td>368640</td>
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
    <td>45.5</td>
    <td>38.0</td>
    <td>2.0</td>
    <td>38.1</td>
    <td>577536</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>37.2</td>
    <td>47.4</td>
    <td>39.0</td>
    <td>1.0</td>
    <td>38.4</td>
    <td>1163264</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.0</td>
    <td>48.1</td>
    <td>42.0</td>
    <td>1.0</td>
    <td>41.7</td>
    <td>438272</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>39.2</td>
    <td>48.5</td>
    <td>42.0</td>
    <td>2.0</td>
    <td>41.1</td>
    <td>430080</td>
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
  <td>37.2</td>
    <td>47.8</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>39.1</td>
    <td>524288</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>37.3</td>
    <td>49.3</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>39.0</td>
    <td>1216512</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>40.4</td>
    <td>48.0</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.2</td>
    <td>548864</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>40.5</td>
    <td>53.3</td>
    <td>43.0</td>
    <td>2.0</td>
    <td>42.1</td>
    <td>454656</td>
</tr>
</table>


