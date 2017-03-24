# A Define type wrapping the azure_resource_template type
# and utilizing a template file to create Azure Network
# Security Groups.
define azure::arm::networksecuritygroup (
  $ensure = present,
  $resource_group,
  $address_prefix,
  $subnet_prefix,
  $rules = null,
) {

  if $ensure == absent {
    warning('Ensure => absent only removes the deployment from the resource group, not the individual resource.  It is recommended that all resources in a resource group share a lifecycle and be decomissioned together by deleting the entire resource group')
  }

  azure_resource_template { $name:
    ensure          => $ensure,
    resource_group  => $resource_group,
    content         => file("${module_name}/arm/networksecuritygroup.json"),
    params          => {
#      rulesArray    => $rules,
      addressPrefix => $address_prefix,
      subnetPrefix  => $subnet_prefix,
    },
  }
}
