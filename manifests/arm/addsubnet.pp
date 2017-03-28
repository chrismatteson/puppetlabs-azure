# A Define type wrapping the azure_resource_template type
# and utilizing a template file to add subnets to an Azure
# vnet.
define azure::arm::addsubnet (
  $ensure = present,
  $resource_group,
  $existing_vnet_name,
  $address_prefix,
) {

  if $ensure == absent {
    warning('Ensure => absent only removes the deployment from the resource group, not the individual resource.  It is recommended that all resources in a resource group share a lifecycle and be decomissioned together by deleting the entire resource group')
  }

  azure_resource_template { $name:
    ensure                   => $ensure,
    resource_group           => $resource_group,
#    content                  => file("${module_name}/arm/addsubnet.json"),
    source                   => 'https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-subnet-add-vnet-existing/azuredeploy.json',
    params                   => {
      existingVNETName       => $existing_vnet_name,
      newSubnetName          => $name,
      newSubnetAddressPrefix => $address_prefix,
    }
  }
}
