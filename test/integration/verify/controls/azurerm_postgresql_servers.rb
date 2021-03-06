resource_group = input('resource_group', value: nil)
postgresql_server_name = input('postgresql_server_name', value: nil)

control 'azurerm_postgresql_servers' do
  only_if { ENV['SQL'] }

  describe azurerm_postgresql_servers(resource_group: resource_group) do
    it           { should exist }
    its('names') { should include postgresql_server_name }
  end

  describe azurerm_postgresql_servers do
    it            { should exist }
    its('names')  { should include postgresql_server_name }
  end
end
