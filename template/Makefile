########
#
# Summary: 
#    This makefile can manage C and C++ source files. 
#    The output executable is defined in Files section.
#    Sources are searched in the folder $(SRCDIR), "src" by default
#    Headers are searched in the folder $(INCDIR), "include" by default
#    Libraries are searched in the folder $(LIBDIR), "lib" by default
#    You must specify needed libraries in Compilation Settings : Linkage
#
# Usage: 
#    There is three compilation mode : release, debug and test
#    You can execute one with the commands 'make' or 'make release', 
#    'make debug' and 'make test'.
#
#    each of these builds are compiled and linked in specifics subdirectories
#    inside obj and bin.
#
#    You can create your own build with the command 'make <name>'
#    If <name> contains "release", "debug" or "test", the compilation mode is 
#    adapted. Else, a light-optionned compilation will occured
#    The result will be in a subdirectory of the name of the build
#
#    - release mode optimize the code (warn if the optimization may modify the
#    behaviour of the program). It is intended to compile a proper version.
#    - debug mode add debug information, warn about many things, and suggest 
#    some improvements. If it is too verbose for you, you can deactivate some
#    warnings in Compilation settings, or whole categories in Build settings.
#    - test mode compile extra files places in a subdirectory of $(TESTDIR), 
#    "test" by default, of the name of the build. (for example, BUILD=test_0 
#    will compile every sources in $(TESTDIR)/test_0/ )
#
# TL;DR: 
#    make
#    make release
#    make debug
#    make test
#    make clean
#    make cleanall
#    make time
#    made valgrind
#
########

### Make settings ###
## Disable builtin rules
.SUFFIXES: 
MAKEFLAGS += --no-builtin-rules

## Active parallel jobs
MAKEFLAGS += --jobs=4


### Compilation settings ###

## C compiler
CC  = gcc

## C++ compiler
CXX = g++

## Linker
LD  = g++

## Cleaner
RM  = rm -rf

## Base flags
CFLAGS = -std=c11 -pipe
CXXFLAGS = -std=c++14 -pipe
## C/C++ Warning options
CCXXFLAGS_WARNINGS += -Wall # many warnings
CCXXFLAGS_WARNINGS += -Wextra # more warnings
CCXXFLAGS_WARNINGS += -Wpedantic # strict ISO
## C/C++ Advanced warning options
CCXXFLAGS_WARNINGS_ADV += -Warray-bounds # warn about subscripts to arrays that are always out of bounds
CCXXFLAGS_WARNINGS_ADV += -Wcast-align # warn when the alignment is not respected in a cast
CCXXFLAGS_WARNINGS_ADV += -Wcast-qual # check stranges cast with differents qualifier
CCXXFLAGS_WARNINGS_ADV += -Wconversion # warn for implicit conversions
CCXXFLAGS_WARNINGS_ADV += -Wdate-time # warn for the use of "__TIME__", "__DATE__" or "__TIMESTAMP__"
CCXXFLAGS_WARNINGS_ADV += -Wdouble-promotion # warn for literals treated as double instead of float
CCXXFLAGS_WARNINGS_ADV += -Wduplicated-cond # warn for duplicate conditions
CCXXFLAGS_WARNINGS_ADV += -Wfloat-equal # warn if floating-point values are compared
CCXXFLAGS_WARNINGS_ADV += -Wformat=2 # check calls to printf, scanf, ...
CCXXFLAGS_WARNINGS_ADV += -Wformat-signedness # also check for signe
CCXXFLAGS_WARNINGS_ADV += -Wlogical-op # warn about suspicious logical operations
CCXXFLAGS_WARNINGS_ADV += -Wmissing-include-dirs # warn if an include directory doesn't exist
CCXXFLAGS_WARNINGS_ADV += -Wnormalized=none # check for similar characters (UTF...) which are differents
CCXXFLAGS_WARNINGS_ADV += -Wplacement-new=2 # check for placements
CCXXFLAGS_WARNINGS_ADV += -Wredundant-decls # warn if anything is declared twice in the same scope
CCXXFLAGS_WARNINGS_ADV += -Wshadow # warn if a local variable shadow something
CCXXFLAGS_WARNINGS_ADV += -Wwrite-strings # check for const char*
CCXXFLAGS_WARNINGS_ADV += -Wmissing-declarations # warn if a function is defined without prototype
CCXXFLAGS_WARNINGS_ADV += -Wundef # warn about undefined preprocessor identifiers
CCXXFLAGS_WARNINGS_ADV += -Wunused # warn about unused things
## C/C++ Optimisation warnings
CCXXFLAGS_OPTIM += -O3 # enable optimization
#CCXXFLAGS_OPTIM += -Os # enable optimization for size
CCXXFLAGS_OPTIM += -Wdisabled-optimization # warn if a requested optimization pass is disabled
CCXXFLAGS_OPTIM += -Wstrict-overflow # warn about simplification that may modify overflow behaviour
CCXXFLAGS_OPTIM += -Wstrict-overflow=4
CCXXFLAGS_OPTIM += -Wunsafe-loop-optimizations # warn if a loop optimization modify overflow behaviour
## C/C++ Tracking options
CCXXFLAGS_DEBUG += -ggdb2 -DDEBUG
CCXXFLAGS_DEBUG += -fstack-protector-all # track buffer overflows
CCXXFLAGS_DEBUG += -fdelete-null-pointer-checks # follow null dereference
CCXXFLAGS_DEBUG += -flto-odr-type-merging # enable detailed diagnostic about definitions
CCXXFLAGS_DEBUG += -feliminate-unused-debug-symbols # debug info don't have unused symbols
CCXXFLAGS_DEBUG += -fvar-tracking # track variables
## C Warnings
CFLAGS_WARNINGS += -Wbad-function-cast # warn when a cast don't match
CFLAGS_WARNINGS += -Wmissing-prototypes # warn if a function is defined without prototype
CFLAGS_WARNINGS += -Wincompatible-pointer-types # warn for incompatible type conversion of pointers
CFLAGS_WARNINGS += -Wstrict-prototypes # check the argument types
CFLAGS_WARNINGS += -Wjump-misses-init # warn if a jump cause problem with initializations
CFLAGS_WARNINGS += -Wunsuffixed-float-constants # warn for floating constant without a suffix
## C++ Warnings
CXXFLAGS_WARNINGS += -Wctor-dtor-privacy # check strange privacy in classes
CXXFLAGS_WARNINGS += -Wnon-virtual-dtor # check for dangerous non-virtual destructors
CXXFLAGS_WARNINGS += -Woverloaded-virtual # warn if a virtual function is hidden
CXXFLAGS_WARNINGS += -Wsign-promo # warn when overload chooses a signed type instead of an unsigned one
CXXFLAGS_WARNINGS += -Wzero-as-null-pointer-constant # warn when 0 is used instead of NULL
CXXFLAGS_WARNINGS += -Wsign-conversion # check sign conversions
CXXFLAGS_WARNINGS += -Wstrict-null-sentinel # warn about NULL sentinels
## C++ Suggestions
CXXFLAGS_SUGGEST += -Wsuggest-final-types # suggest to make final somes virtual types
CXXFLAGS_SUGGEST += -Wsuggest-final-methods # suggest to make final somes virtual methods
CXXFLAGS_SUGGEST += -Wsuggest-override # suggest to make override somes functions
CXXFLAGS_SUGGEST += -Wuseless-cast # useless cast...

## Linkage
LDFLAGS  = -L$(LIBDIR)
LDFLAGS += -lpthread
LDFLAGS += -lsfml-system
LDFLAGS += -lsfml-window
LDFLAGS += -lsfml-graphics
LDFLAGS += -lGL
LDFLAGS += -lGLEW

## Pre-processor
CPPFLAGS = -I$(INCDIR) -MMD -MP -MF $(DEPDIR)/$*.d -MQ $@


### Build settings ###

## Default
BUILD ?= release

ifeq ($(findstring debug,$(BUILD)), debug)
CFLAGS += $(CCXXFLAGS_WARNINGS)
CFLAGS += $(CCXXFLAGS_WARNINGS_ADV)
CFLAGS += $(CCXXFLAGS_DEBUG)
CFLAGS += $(CFLAGS_WARNINGS)
CXXFLAGS += $(CCXXFLAGS_WARNINGS)
CXXFLAGS += $(CCXXFLAGS_WARNINGS_ADV)
CXXFLAGS += $(CCXXFLAGS_DEBUG)
CXXFLAGS += $(CXXFLAGS_WARNINGS)
CXXFLAGS += $(CXXFLAGS_SUGGEST)
endif
ifeq ($(findstring test,$(BUILD)), test)
CFLAGS += $(CCXXFLAGS_WARNINGS)
CFLAGS += $(CCXXFLAGS_DEBUG)
CXXFLAGS += $(CCXXFLAGS_WARNINGS)
CXXFLAGS += $(CCXXFLAGS_DEBUG)
SRC   += $(wildcard $(TESTDIR)/*.c)
SRC   += $(wildcard $(TESTDIR)/*.cpp)
OBJ   += $(filter %.o, $(patsubst $(TESTDIR)/%.c, $(OBJDIR)/%.o, $(SRC)))
OBJ   += $(filter %.o, $(patsubst $(TESTDIR)/%.cpp, $(OBJDIR)/%.o, $(SRC)))
DEP   += $(filter %.d, $(patsubst $(TESTDIR)/%.c, $(DEPDIR)/%.d, $(SRC)))
DEP   += $(filter %.d, $(patsubst $(TESTDIR)/%.cpp, $(DEPDIR)/%.d, $(SRC)))
endif
ifeq ($(findstring release,$(BUILD)), release)
CFLAGS += $(CCXXFLAGS_WARNINGS)
CFLAGS += $(CCXXFLAGS_OPTIM)
CXXFLAGS += $(CCXXFLAGS_WARNINGS)
CXXFLAGS += $(CCXXFLAGS_OPTIM)
endif

### Paths ###

SRCDIR       = src
INCDIR       = include
LIBDIR       = lib
TESTDIR_BASE = test
BINDIR_BASE  = bin
OBJDIR_BASE  = obj
DEPDIR_BASE  = dep
BINDIR       = $(BINDIR_BASE)/$(BUILD)
OBJDIR       = $(OBJDIR_BASE)/$(BUILD)
DEPDIR       = $(DEPDIR_BASE)/$(BUILD)
TESTDIR      = $(TESTDIR_BASE)/$(BUILD)

### Files ###

EXEC   = $(BINDIR)/exe
MAIN   = $(SRCDIR)/main.cpp
SRC   += $(wildcard $(SRCDIR)/*.c)
SRC   += $(wildcard $(SRCDIR)/*.cpp)
ifeq ($(findstring test,$(BUILD)), test)
SRC   := $(filter-out $(MAIN), $(SRC))
endif
OBJ   += $(filter %.o, $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC)))
OBJ   += $(filter %.o, $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRC)))
DEP   += $(filter %.d, $(patsubst $(SRCDIR)/%.c, $(DEPDIR)/%.d, $(SRC)))
DEP   += $(filter %.d, $(patsubst $(SRCDIR)/%.cpp, $(DEPDIR)/%.d, $(SRC)))

### Rules ###

## Build rules

.DEFAULT: all
.PHONY: all
all: $(EXEC)

.PHONY: release
release:
	@make BUILD=release

.PHONY: debug
debug:
	@make BUILD=debug

.PHONY: test
test:
	@make BUILD=test

## File rules

$(EXEC): $(OBJ)
	$(LD) $(LDFLAGS) $(LDLIB) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $< -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $< -o $@

$(OBJDIR)/%.o: $(TESTDIR)/%.cpp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $< -o $@

$(OBJDIR)/%.o: $(TESTDIR)/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $< -o $@

## Dir rules

$(EXEC): | $(BINDIR)

$(OBJ): | $(OBJDIR)

$(DEP): | $(DEPDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(DEPDIR):
	mkdir -p $(DEPDIR)

## Dependencies

-include $(DEP)

## Special rules

.PHONY: clean
clean: 
	$(RM) $(OBJDIR_BASE)

.PHONY: cleanall
cleanall: clean
	$(RM) $(BINDIR_BASE)
	$(RM) $(DEPDIR_BASE)

.PHONY: time
time: $(EXEC)
	time -p $<

.PHONY: valgrind
valgrind: $(EXEC)
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --suppressions=valgrind_ignore $(EXEC)

## Useless rules

.PHONY: nothing
nothing:

.PHONY: up
up:
	@make CC='echo $(CC)' CXX='echo $(CXX)' LD='echo $(LD)' RM='echo $(RM)'

.PHONY: sandwich
sandwich:
	@if [ ${USER} != "root" ]; then echo "What? Make it yourself."; else echo "Okay."; fi

