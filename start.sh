#!/bin/sh
cd `dirname $0`
if [ -n "$1" ]; then
	export BCRYPT_PATH=$1
	exec erl -pa $PWD/ebin -boot start_sasl -s bcrypt_app
else
	echo "Missing path to the bcrypt binary as parameter!"
fi
