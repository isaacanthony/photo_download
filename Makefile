download:
	$(eval dir=`echo "$(file)" | cut -d "." -f 1`)
	sort $(file) | uniq | sed -e "s/\r//g" | xargs wget -nc --tries=5 -P downloads/$(dir)

edit:
	mogrify -resize 299x299 downloads/*/*

clean:
	rm -rf downloads
