azure_resource_group { 'test-cm':
  ensure   => present,
  location => 'eastus',
} ->
azure::arm::addsubnet { '172.16.0.128-25':
  ensure             => present,
  resource_group     => 'test-cm',
  existing_vnet_name => 'test',
  address_prefix     => '172.16.0.128/25',
}
