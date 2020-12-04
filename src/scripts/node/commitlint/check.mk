# Dependencies:
# - none

commitlint_docker_name_prefix=our-scripts-commitlint-make-$(now_date_time_tag)
commitlint_docker=ourchitecture/git-commitlint

.PHONY: commitlint-check
commitlint-check:
ifndef commitlint_docker_name_prefix
	$(error commitlint_docker_name_prefix is not set)
endif
ifndef commitlint_docker
	$(error commitlint_docker is not set)
endif
ifndef COMMIT_COUNT
	$(error COMMIT_COUNT is not set)
endif
	@docker run --rm -t \
		--name $(commitlint_docker_name_prefix)-$@ \
		-v $(shell pwd):/app \
		-w /app \
		$(commitlint_docker) \
		commitlint --from HEAD~${COMMIT_COUNT} --to HEAD
