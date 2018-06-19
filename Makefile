all: download edit

download:
	@while read -r line; do \
		dir=`echo "$${line}" | cut -d , -f 1 | tr '[:upper:]' '[:lower:]' | tr ' ' '_'`; \
		url=`echo "$${line}" | cut -d , -f 2`; \
		wget -nc --timeout=3 --tries=3 -P downloads/$${dir} $${url}; \
	done < $(file)

count:
	ls -R downloads/ | wc -l

edit:
	mogrify -resize 299x299 -format jpg downloads/*/*
	find ./downloads/ -type f ! -name '*.jpg' -delete

clean:
	rm -rf downloads
