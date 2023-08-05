module LinuxSystemInfo
  class << self
    def memory
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

    def storage
      output = Hash.new
      storage = `df -h`
      storage = storage.split("\n")
      storage.each do |file|
        file = file.split
        next if file[0][0..4] != '/dev/'
        next if file[1].nil?
        output[file[0]] = {
          :size            => file[1],
          :used            => file[2],
          :available       => file[3],
          :used_percentage => file[4],
          :mount           => file[5]
        }
      end
      output
    end
  end
end
