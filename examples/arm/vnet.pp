azure::arm::vnet { 'test':
  ensure         => present,
  resource_group => 'chrismatteson1',
  address_prefix => '172.18.0.0/24',
}
