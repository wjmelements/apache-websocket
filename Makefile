NAMES=mod_websocket mod_websocket_draft76
SRC=$(addsuffix .c,$(NAMES))
MODULES=$(addprefix .libs/,$(addsuffix .so, $(NAMES)))
.PHONY: all clean again
all: $(MODULES)
.libs/%.so: %.c
	apxs -c $^
clean:
	rm -rf .libs
install: $(SRC)
	@for module in $(SRC); do \
		printf Installing $$modula...;\
		apxs -c -i $$module\
			&& echo SUCCESS\
			|| echo FAILURE;\
	done
again: clean all
