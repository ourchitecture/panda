now_date_time_tag=`date +'%Y%m%d%H%M%S'`
root_dir_path := $(dir $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
my_dir_path := $(dir $(CURDIR)/$(firstword $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
src_dir_path := $(root_dir_path)/src
scripts_dir_path := $(src_dir_path)/scripts
