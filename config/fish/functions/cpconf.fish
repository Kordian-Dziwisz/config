#Made by Kordian Dziwisz kordian.dziwisz@gmail.com
#src is git repository location, default ./config (usefull if you already created links and saved )
#dest is destination directory with .config, default ~/.config
#add forward slash when  setting src or dest

function cpconf -a src dest --description "copy config files from source to destination"

	test -z $dest && set -l dest "$HOME/.config"
	set -l dest (realpath $dest)

	test -z $src && set -l src "config"
	if test $src = "config";
		read -lP "do you want to copy cpconf.fish to your fish functions? [Y/n] " reply
		test $reply = 'Y' -o $reply = 'y' && ln -f cpconf.fish -t "$dest/fish/functions"
	end
	set -l src (realpath $src)
	
	cd $src
	for file in ./**
		set -l file (echo $file | cut -c 3-)
		if test ! -d "$src/$file"
			ln -i "$src/$file" "$dest/$file"
		end
	end
end