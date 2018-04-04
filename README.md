# photo_download
Mass download + edit photo urls

## Usage
Download all photo urls in `cars.csv` to `./downloads/cars/`.
```
make download file=cars.csv
```

Resize all photos in `./downloads/`.
```
make edit
```

Delete `./downloads/`.
```
make clean
```
