require 'LinuxSystemInfo/version'

module LinuxSystemInfo
  class << self
    def connection_info
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

    def cpu_info
      cpu = `lscpu`
      cpu = cpu.split("\n")

      cpu_detail = `cat /proc/cpuinfo`
      cpu_detail = cpu_detail.split("\n")

      {
        :model         => {
          :name   => cpu_detail.grep(/model name/).first.split(':').last,
          :number => cpu.grep(/Model/).first.split.last
        },
        :address_sizes => cpu_detail.grep(/address sizes/).first.split(':').last,
        :architecture  => cpu.grep(/Architecture/).first.split.last,
        :threads       => cpu.grep(/Thread/).first.split.last,
        :cores         => cpu.grep(/Core/).first.split.last,
        :socket        => cpu.grep(/Socket/).first.split.last,
        :family        => cpu.grep(/family/).first.split.last,
        :flags         => cpu_detail.grep(/flags/).first.split(':').last,
        :L1            => {
          :d => cpu.grep(/L1d cache/).first.split.last,
          :i => cpu.grep(/L1i cache/).first.split.last
        },
        :L2            => cpu.grep(/L2 cache/).first.split.last,
        :L3            => cpu.grep(/L3 cache/).first.split.last
      }
    end

    def memory_info
      ram = `free -m`
      ram = ram.split("\n")[1].split
      {
        :unit    => 'Megabyte',
        :total   => ram[1],
        :used    => ram[2],
        :free    => ram[3],
        :shared  => ram[4],
        :buffers => ram[5],
        :cached  => ram[6]
      }
    end

    def storage_info
      output = Hash.new
      storage = `df -h`
      storage = storage.split("\n")
      storage.each do |file|
        file = file.split
        next if file[0][0..4] != '/dev/'
        output[file[0]] = {
          :size            => file[1],
          :used            => file[2],
          :avail           => file[3],
          :used_percentage => file[4],
          :mount           => file[5]
        }
      end
      output
    end

    def video_info
      video = `lspci`
      video = video.split("\n").find { |e| /VGA/ =~ e }
      video.split(':')[2].strip
    end

    def audio_info
      data = Array.new
      audio = `lspci`
      audios = audio.split("\n").grep /Audio/
      audios.each do |audio|
        audio = audio.split(':')
        data.push audio[2]
      end
      data
    end

    def usb_info
      data = Array.new
      usb = `lspci`
      usb = usb.split("\n")
      usbs = usb.grep /USB/
      usbs.each do |usb|
        usb = usb.split(':')
        data.push usb[2]
      end
      data
    end

    def network_info
      data = Array.new
      connection = `lspci`
      connection = connection.split("\n")
      connections = connection.grep /(Network|Ethernet)/
      connections.each do |connection|
        connection = connection.split(':')
        data.push connection[2]
      end
      data
    end

    def to_hash
      {
        :cpu        => cpu_info,
        :ram        => memory_info,
        :storage    => storage_info,
        :network    => network_info,
        :connection => connection_info,
        :video      => video_info,
        :audio      => audio_info,
        :usb        => usb_info
      }
    end

    def to_s
      JSON.pretty_generate to_hash
    end

    def to_json
      JSON.pretty_generate to_hash
    end
  end
end
