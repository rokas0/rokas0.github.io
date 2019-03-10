prebuild:
	aws s3 sync s3://rokaso.com-fullsize-images fullsize-images/

build:
	docker run --rm --volume="$(shell PWD):/srv/jekyll" -p 4300:4000 -it jekyll/builder jekyll build

postbuild:
	aws s3 sync _site/_generated-smaller-size-images s3://images.rokaso.com --acl public-read --size-only
	find '/Users/oro01/projects/rokas0.github.io/_site' -not -path '*/\.*' -type f -print0 | xargs -0 sed -i '' 's+/_generated-smaller-size-images/+https://d1ra7kav7kguzj.cloudfront.net/+g'

serve:
	docker run --rm --volume="$(shell pwd):/srv/jekyll" -p 4300:4000 -it jekyll/builder jekyll serve

migrate:
	sed -i '' 's/rokaso.lt/rokaso.com/g' _posts/*
	sed -i '' 's+http:/wp-content+http://rokaso.com/wp-content+g' _posts/*.md
	find _posts -name "*.md" -size -1k #-delete
