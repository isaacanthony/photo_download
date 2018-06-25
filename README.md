# photo_download
Mass download + edit photo urls

## Usage

### Input CSV Structure
The input CSV should have at least two columns and no header row.
The first column needs to be the target class.
The second column needs to be the photo url.
Any columns after the first two are ignored.
Here is an example CSV: `cars.csv`.
```
honda civic,https://images.com/1.jpg
toyota corolla,https://images.com/2.jpg
toyota corolla,https://images.com/3.jpg
```

### Commands
Download all photo urls in `cars.csv` to `./downloads/`.
```
make download file=cars.csv
```

Split all photo urls in `cars.csv` into `./downloads/test` and `./downloads/train` based on percent to test
```
make split file=cars.csv pct=.2
```

Resize all photos in `./downloads/`.
```
make edit
```

Run split, download, and edit steps with percent set to .2.
```
make file=cars.csv
```

Count number of photos downloaded.
```
make count
```

Delete `./downloads/`.
```
make clean
```
