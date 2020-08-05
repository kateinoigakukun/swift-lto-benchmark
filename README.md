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
    <td>307.0 KB</td>
    <td>251.2 KB</td>
    <td>250.7 KB</td>
    <td>202.8 KB</td>
</tr>
<tr>
    <td>O</td>
    <td>309.9 KB</td>
    <td>253.6 KB</td>
    <td>299.3 KB</td>
    <td>233.2 KB</td>
</tr>
<tr>
    <td>Osize</td>
    <td>261.8 KB</td>
    <td>221.1 KB</td>
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
    <td>6.03 s</td>
    <td>7.53 s</td>
    <td>10.40 s</td>
    <td>8.88 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>23.87 s</td>
    <td>22.49 s</td>
    <td>24.37 s</td>
    <td>22.75 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>9.75 s</td>
    <td>10.95 s</td>
    <td>9.86 s</td>
    <td>8.81 s</td>
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
  <td>52.4</td>
    <td>61.6</td>
    <td>56.0</td>
    <td>2.0</td>
    <td>56.5</td>
    <td>4149248</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>50.9</td>
    <td>61.4</td>
    <td>54.0</td>
    <td>2.0</td>
    <td>53.8</td>
    <td>4120576</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>49.1</td>
    <td>61.0</td>
    <td>53.0</td>
    <td>2.0</td>
    <td>52.7</td>
    <td>4087808</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>49.7</td>
    <td>57.5</td>
    <td>53.0</td>
    <td>2.0</td>
    <td>52.7</td>
    <td>4046848</td>
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
    <td>40.3</td>
    <td>37.0</td>
    <td>1.0</td>
    <td>37.2</td>
    <td>4091904</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>34.0</td>
    <td>42.6</td>
    <td>37.0</td>
    <td>1.0</td>
    <td>36.8</td>
    <td>4022272</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>33.8</td>
    <td>44.2</td>
    <td>36.0</td>
    <td>1.0</td>
    <td>36.3</td>
    <td>4038656</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>35.4</td>
    <td>42.5</td>
    <td>38.0</td>
    <td>2.0</td>
    <td>38.2</td>
    <td>4055040</td>
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
  <td>36.4</td>
    <td>63.9</td>
    <td>41.0</td>
    <td>3.0</td>
    <td>40.0</td>
    <td>4235264</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>36.5</td>
    <td>53.5</td>
    <td>40.0</td>
    <td>3.0</td>
    <td>39.2</td>
    <td>4296704</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>36.9</td>
    <td>46.6</td>
    <td>40.0</td>
    <td>2.0</td>
    <td>39.3</td>
    <td>4059136</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>35.7</td>
    <td>44.2</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>39.2</td>
    <td>3997696</td>
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
    <td>128.39 s</td>
    <td>112.43 s</td>
    <td>200.08 s</td>
    <td>160.51 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>461.30 s</td>
    <td>411.96 s</td>
    <td>459.95 s</td>
    <td>419.98 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>345.28 s</td>
    <td>312.44 s</td>
    <td>328.46 s</td>
    <td>288.00 s</td>
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
  <td>474.9</td>
    <td>557.3</td>
    <td>491.0</td>
    <td>11.0</td>
    <td>491.1</td>
    <td>2363392</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>423.6</td>
    <td>510.4</td>
    <td>436.0</td>
    <td>12.0</td>
    <td>434.1</td>
    <td>3018752</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>342.4</td>
    <td>459.7</td>
    <td>364.0</td>
    <td>20.0</td>
    <td>356.7</td>
    <td>2154496</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>342.4</td>
    <td>411.0</td>
    <td>364.0</td>
    <td>18.0</td>
    <td>355.2</td>
    <td>1921024</td>
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
  <td>65.5</td>
    <td>74.2</td>
    <td>70.0</td>
    <td>2.0</td>
    <td>69.5</td>
    <td>1355776</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>65.9</td>
    <td>80.7</td>
    <td>71.0</td>
    <td>3.0</td>
    <td>70.1</td>
    <td>1372160</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>66.2</td>
    <td>78.3</td>
    <td>72.0</td>
    <td>2.0</td>
    <td>71.7</td>
    <td>1380352</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>66.0</td>
    <td>81.5</td>
    <td>72.0</td>
    <td>3.0</td>
    <td>71.0</td>
    <td>1261568</td>
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
  <td>67.4</td>
    <td>80.8</td>
    <td>73.0</td>
    <td>3.0</td>
    <td>72.8</td>
    <td>1396736</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>67.1</td>
    <td>80.1</td>
    <td>71.0</td>
    <td>2.0</td>
    <td>71.4</td>
    <td>1355776</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>66.9</td>
    <td>79.3</td>
    <td>71.0</td>
    <td>3.0</td>
    <td>70.9</td>
    <td>1269760</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>65.3</td>
    <td>77.4</td>
    <td>70.0</td>
    <td>2.0</td>
    <td>69.4</td>
    <td>1134592</td>
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
    <td>36.08 s</td>
    <td>33.17 s</td>
    <td>48.85 s</td>
    <td>43.67 s</td>
</tr>
    <tr>
    <td>O</td>
    <td>65.72 s</td>
    <td>60.80 s</td>
    <td>63.86 s</td>
    <td>63.07 s</td>
</tr>
    <tr>
    <td>Osize</td>
    <td>40.58 s</td>
    <td>35.16 s</td>
    <td>34.68 s</td>
    <td>33.42 s</td>
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
  <td>74.2</td>
    <td>99.3</td>
    <td>80.0</td>
    <td>3.0</td>
    <td>79.2</td>
    <td>815104</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>71.9</td>
    <td>85.5</td>
    <td>77.0</td>
    <td>2.0</td>
    <td>76.5</td>
    <td>839680</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>66.3</td>
    <td>89.1</td>
    <td>70.0</td>
    <td>3.0</td>
    <td>69.5</td>
    <td>544768</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>64.6</td>
    <td>74.9</td>
    <td>68.0</td>
    <td>2.0</td>
    <td>68.3</td>
    <td>430080</td>
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
    <td>49.2</td>
    <td>40.0</td>
    <td>2.0</td>
    <td>40.2</td>
    <td>585728</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>36.9</td>
    <td>47.9</td>
    <td>40.0</td>
    <td>1.0</td>
    <td>39.9</td>
    <td>638976</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>35.6</td>
    <td>46.6</td>
    <td>39.0</td>
    <td>2.0</td>
    <td>38.9</td>
    <td>462848</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>36.3</td>
    <td>45.7</td>
    <td>39.0</td>
    <td>1.0</td>
    <td>39.0</td>
    <td>458752</td>
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
  <td>37.4</td>
    <td>48.4</td>
    <td>41.0</td>
    <td>2.0</td>
    <td>40.8</td>
    <td>552960</td>
</tr>
<tr>
  <td>Swift LTO</td>
  <td>38.0</td>
    <td>46.2</td>
    <td>40.0</td>
    <td>1.0</td>
    <td>40.3</td>
    <td>540672</td>
</tr>
<tr>
  <td>LLVM LTO</td>
  <td>36.5</td>
    <td>46.0</td>
    <td>39.0</td>
    <td>1.0</td>
    <td>39.4</td>
    <td>524288</td>
</tr>
<tr>
  <td>Swift & LLVM LTO</td>
  <td>36.4</td>
    <td>46.5</td>
    <td>39.0</td>
    <td>1.0</td>
    <td>38.8</td>
    <td>495616</td>
</tr>
</table>


