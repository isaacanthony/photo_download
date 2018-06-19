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

Resize all photos in `./downloads/`.
```
make edit
```

Run both download and edit steps.
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
