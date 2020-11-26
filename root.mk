root_dir_path := $(dir $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
my_dir_path := $(dir $(CURDIR)/$(firstword $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
scripts_dir_path := $(root_dir_path)/src/scripts
