module LinuxSystemInfo
  class << self
    def connection
      output = Hash.new
      network = `ifconfig`
      network = network.split("\n\n")

      network.each do |data|
        interface = data.scan(/^[a-z]+\d?/).first
        next if interface == 'lo'
        next if data.match(/addr:(\d+\.)+\d+/).to_s.sub('addr:', '').empty?
        output[interface] = {
          :mac       => data.match(/HWaddr [a-z0-9:]+/).to_s.sub('HWaddr ', ''),
          :ip        => data.match(/inet addr:(\d+\.)+\d+/).to_s.sub('inet addr:', ''),
          :mask      => data.match(/Mask:(\d+\.?)+/).to_s.sub('Mask:', ''),
          :broadcast => data.match(/Bcast:(\d+\.?)+/).to_s.sub('Bcast:', ''),
          :ip6       => data.match(/inet6 addr: (([a-z]|\d)+([a-z]|\d)+(:|::)+)+(([a-z]|\d)+(\/)*([a-z]|\d)+)/).to_s.sub('inet6 addr:', '').strip
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
