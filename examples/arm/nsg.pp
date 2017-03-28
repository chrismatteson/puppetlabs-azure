azure_resource_group { 'test-cm':
  ensure   => present,
  location => 'eastus',
} ->
azure::arm::networksecuritygroup { 'testnsg':
  ensure         => present,
  resource_group => 'test-cm',
  address_prefix => '172.16.0.0/24',
  subnet_prefix  => '172.16.0.0/24',
  rules          => [
          {
            "name" => "the_rule",
            "properties" => {
              "description"              => "This is the first rule",
              "protocol"                 => "Tcp",
              "sourcePortRange"          => "23-45",
              "destinationPortRange"     => "46-56",
              "sourceAddressPrefix"      => "*",
              "destinationAddressPrefix" => "*",
              "access"                   => "Allow",
              "priority"                 => 123,
              "direction"                => "Inbound"
            }
          }
        ],
  }
