now_date_time_tag=`date +'%Y%m%d%H%M%S'`
root_dir_path := $(dir $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
my_dir_path := $(dir $(CURDIR)/$(firstword $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
src_dir_path := $(root_dir_path)/src
scripts_dir_path := $(src_dir_path)/scripts

.PHONY: require-root
require-root:
ifndef now_date_time_tag
	$(error now_date_time_tag is not set)
endif
ifndef root_dir_path
	$(error root_dir_path is not set)
endif
ifndef my_dir_path
	$(error my_dir_path is not set)
endif
ifndef src_dir_path
	$(error src_dir_path is not set)
endif
ifndef scripts_dir_path
	$(error scripts_dir_path is not set)
endif
