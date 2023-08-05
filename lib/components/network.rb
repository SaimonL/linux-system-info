module LinuxSystemInfo
  class << self
    def connection
      output = Hash.new
      networks = `ifconfig`
      networks = networks.split("\n\n")

      networks.each do |data|
        interface = data.scan(/^[a-z]+\d?/).first
        next if interface == 'lo'

        output[interface] = {
          mac:       data.match(/ether [a-z0-9:]+/).to_s.sub('ether ', ''),
          ip:        data.match(/inet (\d+\.)+\d+/).to_s.sub('inet ', ''),
          mask:      data.match(/netmask (\d+\.?)+/).to_s.sub('netmask ', ''),
          broadcast: data.match(/broadcast (\d+\.?)+/).to_s.sub('broadcast ', ''),
          ip6:       data.match(/inet6 (([a-z]|\d)+([a-z]|\d)+(:|::)+)+(([a-z]|\d)+(\/)*([a-z]|\d)+)/).to_s.sub('inet6 ', '').strip
        }
      end
      output
    end

    def network
      data = Array.new
      connection = `lspci`
      connection = connection.split("\n")
      connections = connection.grep /(Network|Ethernet)/
      connections.each do |connection|
        connection = connection.split(':')
        data.push connection[2].strip
      end
      data
    end
  end
end
