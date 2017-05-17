azure_resource_group { 'test-cm':
  ensure   => present,
  location => 'eastus',
} ->
azure::arm::appsetting { 'testappsetting':
  ensure         => present,
  resource_group => 'test-cm',
  websitename    => 'oilandgas-test',
  key            => 'test_key',
  value          => 'test_value',
  }
