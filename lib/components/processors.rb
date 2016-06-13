module LinuxSystemInfo
  class << self
    def cpu
      cpu = `lscpu`
      cpu = cpu.split("\n")

      cpu_detail = `cat /proc/cpuinfo`
      cpu_detail = cpu_detail.split("\n")

      output = {
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
        :flags         => cpu_detail.grep(/flags/).first.split(':').last
      }

      (1..50).each do |l|
        find = "L#{l}[a-z]* cache:"
        unless cpu.grep(/#{find}/) == []
          output.merge!({ :"L#{l}" => cpu.grep(/#{find}/).first.split(':').last.strip })
        end
      end

      output
    end

    def processes
      users = 'root,nobody,syslog'
      procs = `ps u -U '#{users}' -u '#{users}' -N`
      output = Hash.new
      procs = procs.split("\n")
      procs.slice!(0)
      procs.each do |proc|
        proc = proc.split
        output[proc[1]] = {
          user: proc[0],      pid: proc[1],    cpu: proc[2],
          mem: proc[3],      vsz: proc[4],    rss: proc[5],
          tty: proc[6],     stat: proc[7],  start: proc[8],
          time: proc[9],  command: proc[10]
        }
      end
      output
    end
  end
end