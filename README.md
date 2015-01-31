# LinuxSystemInfo

Linux System Info is a gem that allows you to get information about you're linux
computer. It retrieves information such as CPU, RAM, Hard drive etc. This works
only for your local computer and for Linux Debain or Redhat based operating system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'LinuxSystemInfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LinuxSystemInfo

## Usage

#### CPU

LinuxSystemInfo.cpu

```
{
  :model=> {
    :name=>" Intel(R) Core(TM) i7-3537U CPU @ 2.00GHz",
    :number=>"58"
  },
  :address_sizes=>" 36 bits physical, 48 bits virtual",
  :architecture=>"x86_64",
  :threads=>"2",
  :cores=>"2",
  :socket=>"1",
  :family=>"6",
  :flags=>" fpu vme de pse tsc msr pae mce cx8 apic ...",
  :L1=>{
    :d=>"32K",
    :i=>"32K"
  },
  :L2=>"256K",
  :L3=>"4096K"
}
```

#### RAM

LinuxSystemInfo.memory

```
{
  :unit=>"Megabyte",
  :total=>"7431",
  :used=>"4550",
  :free=>"2881",
  :shared=>"493",
  :buffers=>"85",
  :cached=>"2036"
}
```

Coming soon....

## Contributing

1. Fork it ( https://github.com/[my-github-username]/LinuxSystemInfo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
