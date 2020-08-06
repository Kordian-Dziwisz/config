function power_menu
	set -l in (echo -e "hibernate\nreboot\nshutdown" | dmenu -sb '#006400' -nf '#bbbbbb' -sf '#ffffff' -p "systemctl")
	test $in = 'hibernate' && systemctl suspend-then-hibernate
	test $in = 'reboot' && systemctl reboot
	test $in = 'shutdown' && systemctl shutdown
end