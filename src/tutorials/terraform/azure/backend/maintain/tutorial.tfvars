# name of an existing resource group
resource_group_name     = "rg-our-tutorials"
resource_group_location = "East US"

# the storage account name
storage_name = "sttfstate1234"

# since the name is randomized, a unique tag
# makes it possible to consistently lookup this
# resource using the unique tag value
storage_id_tag_value = "our-tutorials-storage"

# name of the first container (directory)
# it is possible to create zero or more containers
storage_container_name = "tutorials"
