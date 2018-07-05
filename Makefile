
all:
	@make split pct=.2
	@make download file=test.csv
	@make download file=train.csv
	@make edit
	@make count

split:
	@ IFS=$$'\n'; \
	IN=`awk -F, '{print $$1}' $(file) | sort | uniq`; \
	categories=($${IN});\
	COUNT=`echo "$${#categories[@]}"`; \
	unset IFS; \
	for (( n=0; n < $$COUNT; n++ )); do \
		total_files=`grep "$${categories[n]}" $(file) | wc -l`; \
		test_size=`echo $${total_files} \* $(pct) | bc `; \
		test_size_int=`echo $${test_size} | awk '{print int($$1+0.5)}'`; \
		train_size=$$(( $${total_files} - $${test_size_int} )); \
		grep "$${categories[n]}" $(file) | sort -R > tmp; \
		head -n $${test_size_int} tmp >> test.csv; \
		tail -n $${train_size} tmp >> train.csv; \
	done ; \
	rm tmp

download:
	@while read -r line; do \
		dir=`echo $(file) | cut -d "." -f 1`; \
		sub_dir=`echo "$${line}" | cut -d , -f 1 | tr "[:upper:]" "[:lower:]" | tr -cd "[:alnum:] " | sed -e "s/  */_/g"`; \
		url=`echo "$${line}" | cut -d , -f 2`; \
		wget -nc --timeout=3 --tries=3 -P downloads/$${dir}/"$${sub_dir}" $${url}; \
	done < $(file)

edit:
	@find ./downloads/ -type f -print0 | xargs -0 -n100 mogrify -resize 299x299 -background white -gravity center -extent 299x299 -format jpg
	@find ./downloads/ -type f ! -name '*.jpg' -delete

count:
	@echo "total photos downloaded:"
	@find ./downloads/ -type f | wc -l

clean:
	@rm -rf downloads
