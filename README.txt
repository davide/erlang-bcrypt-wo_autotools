erlang-bcrypt
(http://github.com/skarab/erlang-bcrypt/)
=============

erlang-bcrypt is a wrapper around the OpenBSD Blowfish password hashing
algorithm, as described in `"A Future-Adaptable Password Scheme"`_ by Niels
Provos and David Mazieres.

.. _"A Future-Adaptable Password Scheme":
   http://www.openbsd.org/papers/bcrypt-paper.ps


erlang-bcrypt-wo_autotools
==================
The same as erlang-bcrypt but without the autotools (learning) overhead.

There are Makefiles for gcc/linux and mingw/windows as well as project files for
building the bcrypt port with Visual C++ Express 2008.

1) Build the bcrypt port using your preferred method
	- make mingw
	- make gcc
	- opening the solution file priv/build/msvc/bcrypt.sln on Visual C++ Express 2008
	  and building the Release Configuration
	
2) Build the erlang files
	- make erl

Actually this target is already listed as a dependency in the previous
makefile targets so this step isn't really necessary.

3) Run the application via:
		- make run_mingw
		- make run_gcc
		- make run_msvc
	Or passing the appropriate path to start.sh:
		./start.sh priv/c_src/bcrypt/mingw/bcrypt.exe

	This step will load:
		- the sasl application,
		- then the crypto application
		- and finally the bcrypt application

Basic usage instructions
------------------------

1. Hash a password using a salt with the default number of rounds::

        4> Hash = bcrypt:hashpw("foo", bcrypt:gen_salt()).
        "$2...000"

2. Verify the password::

        5> Hash =:= bcrypt:hashpw("foo", Hash).
        true
        6> Hash =:= bcrypt:hashpw("bar", Hash).
        false
   
Authors: Hunter Morris (http://skarab.com/)
Autotools removal by: Davide Marquês (nesrait@gmail.com)
