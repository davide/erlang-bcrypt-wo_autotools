#!/bin/sh
cd `dirname $0`
if [ -n "$1" ]; then
	if [ -f "$1.config" ]; then
		exec erl -config $1 -pa $PWD/ebin -boot start_sasl -s bcrypt_app
	else
		echo "No such file: $1.config!"
	fi
else
	echo "You must specify which config to use."
fi
