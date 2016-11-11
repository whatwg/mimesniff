local: mimesniff.bs
	bikeshed

remote: mimesniff.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@mimesniff.bs > mimesniff.html
