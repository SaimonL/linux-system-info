module LinuxSystemInfo
  class << self
    def memory
      ram = `free -m`
      ram = ram.split("\n")[1].split
      {
        :unit    => 'Megabyte',
        :total   => ram[1].to_i,
        :used    => ram[2].to_i,
        :free    => ram[3].to_i,
        :shared  => ram[4].to_i,
        :buffers => ram[5].to_i,
        :cached  => ram[6].to_i
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
