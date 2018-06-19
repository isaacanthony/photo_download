all: download edit count

download:
	@while read -r line; do \
		dir=`echo "$${line}" | cut -d , -f 1 | tr "[:upper:]" "[:lower:]" | tr -cd "[:alnum:] " | sed -e "s/ \+/_/g"`; \
		url=`echo "$${line}" | cut -d , -f 2`; \
		wget -nc --timeout=3 --tries=3 -P downloads/$${dir} $${url}; \
	done < $(file)

edit:
	@mogrify -resize 299x299 -format jpg downloads/*/*
	@find ./downloads/ -type f ! -name '*.jpg' -delete

count:
	@echo "total photos downloaded:"
	@find ./downloads/ -type f | wc -l

clean:
	@rm -rf downloads
