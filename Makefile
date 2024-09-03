RUBY = bundle exec ruby
BUNDLE = bundle
TEST_FILES = test_*.rb

install:
	$(BUNDLE) install

test:
	$(RUBY) -Itest $(TEST_FILES)

build:
	$(RUBY) build.rb

clean:
	rm -f *.apkg

all: install test build

.PHONY: install test build clean all
