download:
	$(eval dir=`echo "$(file)" | cut -d "." -f 1`)
	sort $(file) | uniq | xargs wget -nc -P downloads/$(dir)

edit:
	mogrify -resize 299x299 downloads/*/*

clean:
	rm -rf downloads
