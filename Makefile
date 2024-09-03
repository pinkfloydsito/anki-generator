RUBY = bundle exec ruby
RAKE = bundle exec rake
BUNDLE = bundle
TEST_FILES = test_*.rb

install:
	$(BUNDLE) install

test:
	$(RAKE)

build:
	$(RUBY) build.rbgenerate_apkg

clean:
	rm -f *.apkg

all: install test build

.PHONY: install test build clean all
