download:
	$(eval dir=`echo "$(file)" | cut -d "." -f 1`)
	sort $(file) | uniq | sed -e "s/\r//g" | xargs wget -nc --timeout=3 --tries=3 -P downloads/$(dir)

count:
	ls -R downloads/ | wc -l

edit:
	mogrify -resize 299x299 -format jpg downloads/*/*
	find ./downloads/ -type f ! -name '*.jpg' -delete

clean:
	rm -rf downloads
