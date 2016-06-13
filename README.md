# LinuxSystemInfo

[![Gem Version](https://badge.fury.io/rb/LinuxSystemInfo.svg)](http://badge.fury.io/rb/LinuxSystemInfo)
[![Dependency Status](https://gemnasium.com/SaimonL/linux-system-info.svg)](https://gemnasium.com/SaimonL/linux-system-info)

Linux System Info is a gem that allows you to get information about you're linux
computer. It retrieves information such as CPU, RAM, Hard drive etc. This works
only for your local computer and for Linux Debain or Redhat based operating system.

# Requirements

The following utility is needed to get a list of devices connected to the PCI bus.

Debain based linux (installed by default)

```bash
sudo apt-get install pciutils sysstat
````

RedHat based linux (not installed by default)

```bash
sudo yum install pciutils sysstat
````

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'LinuxSystemInfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LinuxSystemInfo

# Usage

### Info

#### LinuxSystemInfo.info

```ruby
{
  :os=>"Linux version 3.13.0-45-generic (buildd@phianna) ...",
  :uptime=>"up 5 hours, 57 minutes",
  :users=>"8"
}
```

### CPU

#### LinuxSystemInfo.cpu

```ruby
{
  :model=>
  {
    :name => "Intel(R) Core(TM) i7-3537U CPU @ 2.00GHz",
    :number => "58"
  },
  :address_sizes => "36 bits physical, 48 bits virtual",
  :architecture => "x86_64",
  :threads => "2",
  :cores => "2",
  :socket => "1",
  :family => "6",
  :flags => "fpu vme de pse tsc msr pae mce cx8 apic ...",
  :L1=>
  {
    :d => "32K",
    :i => "32K"
  },
  :L2 => "256K",
  :L3 => "4096K"
}
```

#### LinuxSystemInfo.cpu_usage

```ruby
{
  :user=>"5.71",
  :nice=>"0.31",
  :system=>"1.58",
  :iowait=>"0.32",
  :irq=>"0.00",
  :soft=>"0.02",
  :steal=>"0.00",
  :guest=>"0.00",
  :gnice=>"0.00",
  :idle=>"92.06",
  :usage=>7.94
}
```

### RAM

#### LinuxSystemInfo.memory

```ruby
{
  :unit => "Megabyte",
  :total => "7431",
  :used => "4550",
  :free => "2881",
  :shared => "493",
  :buffers => "85",
  :cached => "2036"
}
```

### Storage

#### LinuxSystemInfo.storage

```ruby
{
  "/dev/sda1" =>
  {
    :size => "88G",
    :used => "14G",
    :available => "70G",
    :used_percentage => "17%",
    :mount => "/"
  },
  "/dev/sda8" =>
  {
    :size => "114G",
    :used => "51G",
    :available => "63G",
    :used_percentage => "45%",
    :mount => "/home"
  },
  "/dev/sda6" =>
  {
    :size => "12G",
    :used => "2.0G",
    :available => "9.3G",
    :used_percentage => "18%",
    :mount => "/repos"
  },
  "/dev/sda5" =>
  {
    :size => "23G",
    :used => "3.1G",
    :available => "20G",
    :used_percentage => "14%",
    :mount => "/virtualbox"
  }
}
```

### Connection

#### LinuxSystemInfo.connection

```ruby
{
  "eth0" =>
  {
    :mac => "80:2f:d5:6b:d5:88",
    :ip => "192.168.1.23",
    :mask => "255.255.255.0",
    :broadcast => "192.168.1.255",
    :ip6 => "fe80::c23f:d5ff:fe6b:d5c8/64"
  }
}
```

### Video

#### LinuxSystemInfo.video

```ruby
[
  "Intel Corporation Haswell-ULT Integrated Graphics Controller (rev 09)"
]
```
### Audio

#### LinuxSystemInfo.audio

```ruby
[
  "Intel Corporation Haswell-ULT HD Audio Controller (rev 09)",
  "Intel Corporation Lynx Point-LP HD Audio Controller (rev 04)"
]
```

### USB

#### LinuxSystemInfo.usb

```ruby
[
  "Intel Corporation Lynx Point-LP USB xHCI HC (rev 04)",
  "Intel Corporation Lynx Point-LP USB EHCI #1 (rev 04)"
]
```

### Network

#### LinuxSystemInfo.network

```ruby
[
  "Intel Corporation Ethernet Connection I218-V (rev 04)",
  "Intel Corporation Wireless 7260 (rev 73)"
]
```

### Host

#### LinuxSystemInfo.hostname

```
"example.com"
```

### Processes

#### LinuxSystemInfo.processes

Returns all process that are not by root, nobody, and syslog user.

```ruby
{
  "929"=>{:user=>"avahi", :pid=>"929", :cpu=>"0.0", :mem=>"0.0", :vsz=>"32348", :rss=>"1644", :tty=>"?", :stat=>"S", :start=>"07:42", :time=>"0:00", :command=>"avahi-daemon:"},
  "932"=>{:user=>"avahi", :pid=>"932", :cpu=>"0.0", :mem=>"0.0", :vsz=>"32224", :rss=>"468", :tty=>"?", :stat=>"S", :start=>"07:42", :time=>"0:00", :command=>"avahi-daemon:"},
  "1096"=>{:user=>"whoopsie", :pid=>"1096", :cpu=>"0.0", :mem=>"0.0", :vsz=>"430420", :rss=>"4964", :tty=>"?", :stat=>"Ssl", :start=>"07:42", :time=>"0:00", :command=>"whoopsie"},
  "1229"=>{:user=>"mysql", :pid=>"1229", :cpu=>"0.0", :mem=>"1.7", :vsz=>"922568", :rss=>"136528", :tty=>"?", :stat=>"Ssl", :start=>"07:42", :time=>"0:21", :command=>"/usr/sbin/mysqld"},
  "1252"=>{:user=>"postgres", :pid=>"1252", :cpu=>"0.0", :mem=>"0.2", :vsz=>"247716", :rss=>"16184", :tty=>"?", :stat=>"S", :start=>"07:42", :time=>"0:00", :command=>"/usr/lib/postgresql/9.3/bin/postgres"},
  "1284"=>{:user=>"postgres", :pid=>"1284", :cpu=>"0.0", :mem=>"0.0", :vsz=>"248580", :rss=>"2996", :tty=>"?", :stat=>"Ss", :start=>"07:42", :time=>"0:00", :command=>"postgres:"},
  "1285"=>{:user=>"postgres", :pid=>"1285", :cpu=>"0.0", :mem=>"0.0", :vsz=>"103392", :rss=>"1772", :tty=>"?", :stat=>"Ss", :start=>"07:42", :time=>"0:00", :command=>"postgres:"},
  [...]
  "1671"=>{:user=>"kernoops", :pid=>"1671", :cpu=>"0.0", :mem=>"0.0", :vsz=>"37144", :rss=>"1008", :tty=>"?", :stat=>"Ss", :start=>"07:42", :time=>"0:00", :command=>"/usr/sbin/kerneloops"}
}
```

### ALL

#### LinuxSystemInfo.all

```ruby
{
  "info": {
    "os": "Linux version 4.4.0-24-generic (buildd@lgw01-12) (gcc version 5.3.1 20160413 (Ubuntu 5.3.1-14ubuntu2.1) ) #43-Ubuntu SMP Wed Jun 8 19:27:37 UTC 2016",
    "uptime": "07:43:25 up  1:04",
    "users": "3 users"
  },
  "hostname": "zen",
  "cpu": {
    "info": {
      "model": {
        "name": " Intel(R) Core(TM) i7-3537U CPU @ 2.00GHz",
        "number": "58"
      },
      "address_sizes": " 36 bits physical, 48 bits virtual",
      "architecture": "x86_64",
      "threads": "2",
      "cores": "2",
      "socket": "1",
      "family": "6",
      "flags": " fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt dtherm ida arat pln pts",
      "L1": "32K",
      "L2": "256K",
      "L3": "4096K"
    },
    "usage": {
      "user": "5.61",
      "nice": "0.28",
      "system": "1.43",
      "iowait": "0.27",
      "irq": "0.00",
      "soft": "0.02",
      "steal": "0.00",
      "guest": "0.00",
      "gnice": "0.00",
      "idle": "92.39",
      "usage": 7.61
    }
  },
  "ram": {
    "unit": "Megabyte",
    "total": "7429",
    "used": "1415",
    "free": "4165",
    "shared": "189",
    "buffers": "1849",
    "cached": "5500"
  },
  "storage": {
    "/dev/sda5": {
      "size": "59G",
      "used": "44G",
      "available": "13G",
      "used_percentage": "78%",
      "mount": "/"
    },
    "/dev/sda7": {
      "size": "175G",
      "used": "29G",
      "available": "137G",
      "used_percentage": "18%",
      "mount": "/home"
    },
    "/dev/sda1": {
      "size": "93M",
      "used": "3.6M",
      "available": "90M",
      "used_percentage": "4%",
      "mount": "/boot/efi"
    }
  },
  "network": [
    "Intel Corporation Centrino Advanced-N 6235 (rev 24)"
  ],
  "connection": {
    "virbr0": {
      "mac": "00:00:00:00:00:00",
      "ip": "192.168.1.1",
      "mask": "255.255.255.0",
      "broadcast": "192.168.122.255",
      "ip6": ""
    },
    "wlp2": {
      "mac": "24:55:18:16:c9:88",
      "ip": "192.168.0.10",
      "mask": "255.255.255.0",
      "broadcast": "192.168.43.255",
      "ip6": "fe80::5a19:343b:3bd8:cc2c/64"
    }
  },
  "video": [
    "Intel Corporation 3rd Gen Core processor Graphics Controller (rev 09)"
  ],
  "audio": [
    "Intel Corporation 7 Series/C210 Series Chipset Family High Definition Audio Controller (rev 04)"
  ],
  "usb": [
    "Intel Corporation 7 Series/C210 Series Chipset Family USB Enhanced Host Controller #2 (rev 04)",
    "Intel Corporation 7 Series/C210 Series Chipset Family USB Enhanced Host Controller #1 (rev 04)"
  ]
}
```

Notice: to_s prints the hash as JSON what is for printing purpose only.
Example: LinuxSystemInfo.to_s
