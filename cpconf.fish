#src is git repository location, default . (usefull if you already created link)
#dest is destination directory with .config, default ~/.config
function cpconf -a src dest --description "copy config files from source to destination"
	if test -z $src
		set src "."
	end
	if test -z $dest
		set dest "$HOME/.config"
	end
	cd $src
	ln -i fish/functions/* -t "$dest/fish/functions"
	ln -i fish/* -t "$dest/fish"
	ln -i ranger/* -t "$dest/ranger"
	ln -i VSCodium/snippets/* -t "$dest/VSCodium/User/snippets"
	ln -i VSCodium/* -t "$dest/VSCodium/User"
	ln -i cpconf.fish -t "$dest/fish/functions"
end