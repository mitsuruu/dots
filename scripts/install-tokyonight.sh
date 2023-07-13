#!/bin/bash

main() {
	$(dirname "$0")/install-common.sh
	check_vars
	link_config
	link_share
	link_files
}

function check_vars {
	shouldexit=false
	if [[ -z "$XDG_CONFIG_HOME" ]]; then
		echo "\$XDG_CONFIG_HOME is not set. Please make sure this is set in your shell."
		shouldexit=true
	fi
	
	if [[ -z "$XDG_DATA_HOME" ]]; then
		echo "\$XDG_DATA_HOME is not set. Please make sure this is set in your shell."
		shouldexit=true
	fi

	if [ $shouldexit = true ]; then
		exit 1
	fi
}

function link_config {
	wd=$PWD
	cd "$(dirname "$0")/../tokyonight-wip/config/"

	for i in *
	do
		echo "Creating symlink for $PWD/$i in $XDG_CONFIG_HOME/"
		ln -sf $PWD/$i $XDG_CONFIG_HOME/
	done
	
	cd $wd
}

function link_share {
	wd=$PWD
	cd "$(dirname "$0")/../tokyonight-wip/share/"

	for i in *
	do
		echo "Creating symlink for $PWD/$i in $XDG_DATA_HOME/"
		ln -sf $PWD/$i $XDG_DATA_HOME/
		RESULT=$?

		if [ $RESULT -ne 0 ]; then
			cd $i
			for j in *
			do
				echo "Creating symlink for $PWD/$j in $XDG_DATA_HOME/$i"
				ln -sf $PWD/$j $XDG_DATA_HOME/$i/
			done
		fi
	done

	cd $wd
}

function link_files {
	cd "$(dirname "$0")/../tokyonight-wip/files/"

	for i in $(find $PWD -type f)
	do
		echo "Creating symlink for $i in $HOME/.$(realpath --relative-to="$PWD" "$i")"
		ln -sf $i "$HOME/.$(realpath --relative-to="$PWD" "$i")"
	done
}

main "$@"
