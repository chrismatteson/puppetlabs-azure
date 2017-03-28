azure_resource_group { 'test-cm':
  ensure   => present,
  location => 'eastus',
} ->
azure::arm::vnet { 'test':
  ensure         => present,
  resource_group => 'test-cm',
  address_prefix => '172.18.0.0/24',
}
