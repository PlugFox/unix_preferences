.PHONY: format get test publish deploy coverage analyze check pana generate gen codegen

format:
	@echo "Formatting the code"
	@dart format -l 80 --fix .
	@dart fix --apply .

get:
	@dart pub get

test: get
	@dart test --debug --coverage=.coverage --platform chrome,vm

publish: generate
	@yes | dart pub publish

deploy: publish

coverage: get
	@dart test --concurrency=6 --platform vm --coverage=coverage test/
	@dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib
#	@mv coverage/lcov.info coverage/lcov.base.info
#	@lcov -r coverage/lcov.base.info -o coverage/lcov.base.info "lib/**.freezed.dart" "lib/**.g.dart"
#	@mv coverage/lcov.base.info coverage/lcov.info
	@lcov --list coverage/lcov.info
	@genhtml -o coverage coverage/lcov.info

analyze: get format
	@echo "Analyze the code"
	@dart analyze --fatal-infos --fatal-warnings

check: analyze
	@dart pub publish --dry-run
	@dart pub global activate pana
	@pana --json --no-warning --line-length 80 > log.pana.json

pana: check

generate: get
	@dart pub global activate protoc_plugin
	@protoc --proto_path=lib/src/protobuf --dart_out=lib/src/protobuf lib/src/protobuf/api.proto
	@dart run build_runner build --delete-conflicting-outputs
	@dart format -l 80 lib/src/protobuf/

gen: generate

codegen: generate