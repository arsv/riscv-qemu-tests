dirs = rv64i rv64m rv64f rv64d
all = $(patsubst %,all-%,$(dirs))
run = $(patsubst %,run-%,$(dirs))
clr = $(patsubst %,clr-%,$(dirs))

default: $(all)
run: $(run)
clean: $(clr)

$(all): all-%:
	$(MAKE) -C $* all

$(run): run-%:
	$(MAKE) -C $* run

$(clr): clr-%:
	$(MAKE) -C $* clean

.PHONY: $(all) $(run)
