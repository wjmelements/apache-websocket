MODULES=$(addprefix .libs/,mod_websocket.so mod_websocket_draft76.so)
.PHONY: all clean again
all: $(MODULES)
.libs/%.so: %.c
	apxs -c $^
clean:
	rm -rf .libs
again: clean all
