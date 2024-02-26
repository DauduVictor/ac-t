
# Config variables (can be overriden from environment or `.bloc_sample_env`)
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-30s %s\n" $$help_command $$help_info ; \
	done

fresh: ## Runs `clean`, `codegen-build`, and `generate-intl` for a fresh setup.
	make gen-all

gen-all:
	@$(MAKE) gen-parallel -j$(shell sysctl -n hw.physicalcpu)

gen-parallel: gen-root \
	gen-robin-core \
	gen-robin-ui

gen-root: ## Generate codegen files and do not watch for changes.
	(flutter clean;flutter pub get;flutter pub run build_runner build --delete-conflicting-outputs)

codegen-build: ## Generate codegen files and do not watch for changes.
	flutter pub run build_runner build --delete-conflicting-outputs

codegen-watch: ## Generate codegen files and watch for changes.
	flutter pub run build_runner watch --delete-conflicting-outputs

test-unit: ## Runs unit tests.
	flutter test

