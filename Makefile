HOME = /home/david
FILES = bash_aliases bash_logout bash_profile bashrc \
        diaryrc diary-tags \
        hgrc profile vimrc selected_editor
TARGETS = $(FILES:%=$(HOME)/.%)

install: ${TARGETS}

${TARGETS}: $(HOME)/.%: %
	cp $< $@
