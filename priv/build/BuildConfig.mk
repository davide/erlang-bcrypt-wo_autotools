ERL=$(shell which erl)
ERLC=$(shell which erlc)

ERL_LIB_DIR=$(shell dirname $(ERL))/../lib
ERL_INTERFACE=$(shell ls $(ERL_LIB_DIR) | grep erl_interface | tail -1)
ERL_INTERFACE_DIR=$(ERL_LIB_DIR)/$(ERL_INTERFACE)

BIN_EXT=.exe
#BIN_EXT=

PROJECTS_DIR=../../c_src


