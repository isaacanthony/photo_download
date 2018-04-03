download:
	sort $(file).csv | uniq | xargs wget -nc -P downloads/$(file)

edit:
	mogrify -resize 299x299 downloads/*/*

clean:
	rm -rf downloads
