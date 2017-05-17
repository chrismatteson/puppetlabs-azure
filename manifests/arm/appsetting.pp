# A Define type wrapping the azure_resource_template type
# and utilizing a template file to create Azure Network
# Security Groups.
define azure::arm::appsetting (
  $ensure = present,
  $websitename,
  $resource_group,
  $key,
  $value,
) {

  if $ensure == absent {
    warning('Ensure => absent only removes the deployment from the resource group, not the individual resource.  It is recommended that all resources in a resource group share a lifecycle and be decomissioned together by deleting the entire resource group')
  }

  azure_resource_template { $name:
    ensure         => $ensure,
    resource_group => $resource_group,
    content        => file("${module_name}/arm/appsetting.json"),
    params         => {
      websitename  => $websitename,
      key          => $key,
      value        => $value,
    },
  }
}
