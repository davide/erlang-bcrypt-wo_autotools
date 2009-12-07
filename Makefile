EBINDIR = ebin
MINGW_BCRYPT_BIN := c_src/bcrypt/mingw/bcrypt
GCC_BCRYPT_BIN := c_src/bcrypt/gcc/bcrypt
MSVC_BCRYPT_BIN := c_src/bcrypt/msvc/Release/bcrypt.exe

erl: $(EBINDIR)
	erl -noshell -s make all -s init stop

$(EBINDIR):
	mkdir -p $(EBINDIR)

mingw: erl
	cd priv/build/mingw; make
	sed "s!%BCRYPT_BIN%!$(MINGW_BCRYPT_BIN)!g" \
		src/bcrypt.app.src > ebin/bcrypt.app

gcc: erl
	cd priv/build/gcc; make
	sed "s!%BCRYPT_BIN%!$(GCC_BCRYPT_BIN)!g" \
		src/bcrypt.app.src > ebin/bcrypt.app

msvc:
	sed "s!%BCRYPT_BIN%!$(MSVC_BCRYPT_BIN)!g" \
		src/bcrypt.app.src > ebin/bcrypt.app

run_mingw: erl
	./start.sh mingw

run_gcc: erl
	./start.sh gcc

run_msvc: erl
	./start.sh msvc

clean:
	rm -rf $(EBINDIR)/*.beam erl_crash.dump
	cd priv/build/mingw; make clean
