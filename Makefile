SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy review

remote: mimesniff.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output mimesniff.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=warning \
	                       -F md-Text-Macro="COMMIT-SHA LOCAL COPY" \
	                       -F file=@mimesniff.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat mimesniff.html; echo ""; \
		rm -f mimesniff.html; \
		exit 22 \
	);

local: mimesniff.bs
	bikeshed spec mimesniff.bs mimesniff.html --md-Text-Macro="COMMIT-SHA LOCAL COPY"

deploy: mimesniff.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh

review: mimesniff.bs
	curl --remote-name --fail https://resources.whatwg.org/build/review.sh
	bash ./review.sh
