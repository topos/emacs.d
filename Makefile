.DEFAULT_GOAL = help

export SHELL = /bin/bash
export PATH := /usr/local/bin:/usr/bin:/bin

dot-prelude: ## clone or pull prelude ~/.prelude
	if [ -d ~/.prelude ]; then cd ~/.prelude && git pull --rebase; else git clone git@github.com:bbatsov/prelude ~/.prelude; fi

dot-emacsd: ## clone or pull emacs.d ~/.emacs.d
	if [ -d ~/.emacs.d ]; then cd ~/.emacs.d && git pull --rebase || exit 0; else git clone git@github.com:topos/emacs.d ~/.emacs.d; fi
	for i in $$(cd ../.prelude && find . -type d -maxdepth 1 | egrep -v '(^\.$$|^./\.git$$)' | sed 's/\.\///g' | grep -v personal) ; do \
		ln -sf ~/.prelude/$$i; \
	done

help: ## help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-18s\033[0m %s\n", $$1, $$2}'
