.PHONY: bin

# Bin path for bins
BINPATH ?= bin
# Bin Sources
BINSOURCE ?= app.rb
# Matches
app.rb := bossrun

# Commands
CP ?= cp
CP_FLAGS ?= -v

$(BINPATH):
	@echo "  CP(link) "$(BINPATH)/$(app.rb); \
	mkdir -p $(BINPATH); \
	$(CP) $(CP_FLAGS) -l $(BINSOURCE) $(app.rb);
