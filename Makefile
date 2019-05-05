build_image:
	docker build . -t rokaso/jekyll

serve:
	docker run --rm --volume="$(shell pwd):/srv/jekyll" -p 4000:4000 -i rokaso/jekyll jekyll serve --drafts

migrate:
	sed -i '' 's/rokaso.lt/rokaso.com/g' _posts/*
	sed -i '' 's+http:/wp-content+http://rokaso.com/wp-content+g' _posts/*.md
	find _posts -name "*.md" -size -1k #-delete


