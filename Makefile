EBINDIR = ebin

erl: $(EBINDIR)
	erl -noshell -s make all -s init stop

$(EBINDIR):
	mkdir -p $(EBINDIR)

mingw: erl
	cd priv/build/mingw; make

gcc: erl
	cd priv/build/gcc; make

run_mingw: erl
	./start.sh priv/c_src/bcrypt/mingw/bcrypt.exe

run_gcc: erl
	./start.sh priv/c_src/bcrypt/gcc/bcrypt

clean:
	rm -rf $(EBINDIR)/*.beam erl_crash.dump
	cd priv/build/mingw; make clean
