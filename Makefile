NODE = node
TEST = vows
TESTS ?= test/*-test.js

test:
	@NODE_ENV=test NODE_PATH=lib $(TEST) $(TEST_FLAGS) $(TESTS)

docs: docs/api.html

docs/api.html: lib/passport-runkeeper/*.js
	dox \
		--title Passport-RunKeeper \
		--desc "RunKeeper authentication strategy for Passport" \
		$(shell find lib/passport-runkeeper/* -type f) > $@

docclean:
	rm -f docs/*.{1,html}

.PHONY: test docs docclean