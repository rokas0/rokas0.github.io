build:
	docker run --rm --volume="$(shell PWD):/srv/jekyll" -p 4300:4000 -it jekyll/builder jekyll build

serve:
	docker run --rm --volume="$(shell PWD):/srv/jekyll" -p 4300:4000 -it jekyll/builder jekyll serve

migrate:
	sed -i '' 's/rokaso.lt/rokaso.com/g' _posts/*
	sed -i '' 's+http:/wp-content+http://rokaso.com/wp-content+g' _posts/*.md
	find _posts -name "*.md" -size -1k #-delete
