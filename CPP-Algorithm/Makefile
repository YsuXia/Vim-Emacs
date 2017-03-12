####get subdirs####
exclude_dirs :=
dirs := $(shell find . -maxdepth 1 -type d)
dirs := $(basename $(patsubst ./%, %, $(dirs)))
dirs := $(filter-out $(exclude_dirs),$(dirs))
SUBDIRS = $(dirs)
#################################################
CXX = g++
CFLAGS = -g
CXXLIBS=
export CXX CFLAGS CXXLIBS

.PHONY: all
all:
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		  echo "make in $$subdir"; \
		  $(MAKE) -C $$subdir;\
		  done
.PHONY: clean
clean:
	@echo "Make Clean"
	@list='$(SUBDIRS)'; for subdir in $$list; do \
		  echo "clean in $$subdir"; \
		  $(MAKE) -C $$subdir clean;\
		  done
