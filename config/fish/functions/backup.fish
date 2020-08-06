#backup selected files to a output
#output archive is gzip

function backup -a output
	cd ~
	set -l date (date +%F)
	tar -cv downloads scripts -f "$output/backup-$date.gzip" --gzip
	set -e date
end
