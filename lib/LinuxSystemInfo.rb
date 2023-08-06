require 'LinuxSystemInfo/version'
require 'json'

require 'LinuxSystemInfo/components/processors'
require 'LinuxSystemInfo/components/network'
require 'LinuxSystemInfo/components/memory'
require 'LinuxSystemInfo/components/media'

require 'LinuxSystemInfo/accounts/users'

module LinuxSystemInfo
  class << self
    def info
      uptime = `uptime`.strip
      uptime = uptime.split(',')

      if uptime[1].match(/\d+ (user|users)/).nil?
        running_time = [ uptime[0], uptime[1] ].join ', '
        users = uptime[2]
      else
        running_time = uptime[0]
        users = uptime[1]
      end

      {
        os: `cat /proc/version`.strip,
        uptime: running_time.strip,
        users: users.strip
      }
    end

    def usb
      data = Array.new
      usb = `lspci`
      usb = usb.split("\n")
      usbs = usb.grep /USB/
      usbs.each do |usb|
        usb = usb.split(':')
        data.push usb[2].strip
      end
      data
    end

    def hostname
      `hostname`.strip
    end

    def all
      {
        info:       info,
        hostname:   hostname,
        cpu:        { info: cpu, usage: cpu_usage },
        ram:        memory,
        storage:    storage,
        network:    network,
        connection: connection,
        video:      video,
        audio:      audio,
        usb:        usb,
        users:      users,
        version:    VERSION
      }
    end

    def to_s
      JSON.pretty_generate(all)
    end
  end
end
