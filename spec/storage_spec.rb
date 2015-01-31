require 'spec_helper'

describe 'With storage info' do
  before(:all) do
    @storage = LinuxSystemInfo.storage
  end

  describe 'the returned value' do
    it 'will have hard drives' do
      expect(@storage.length).to be >= 1
    end

    it 'will have 5 units per drive' do
      expect(@storage.first.last.length).to eq 5
    end

    it 'will have valid size' do
      expect(@storage.first.last[:size]).to match /\d+G/
    end

    it 'will have valid used' do
      expect(@storage.first.last[:used]).to match /\d+G/
    end

    it 'will have valid available' do
      expect(@storage.first.last[:available]).to match /\d+G/
    end

    it 'will have valid used_percentage' do
      expect(@storage.first.last[:used_percentage]).to match /\d+%/
    end

    it 'will have valid mount point' do
      expect(File.exist?(@storage.first.last[:mount])).to eq true
    end

  end
end

# {
#   "/dev/sda1"=>
#     {
#       :size=>"88G",
#       :used=>"14G",
#       :available=>"70G",
#       :used_percentage=>"17%",
#       :mount=>"/"
#     },
#   "/dev/sda8"=>
#     {
#       :size=>"114G",
#       :used=>"51G",
#       :avail=>"63G",
#       :used_percentage=>"45%",
#       :mount=>"/home"
#     },
#   "/dev/sda6"=>
#     {
#       :size=>"12G",
#       :used=>"2.0G",
#       :avail=>"9.3G",
#       :used_percentage=>"18%",
#       :mount=>"/repos"
#     },
#   "/dev/sda5"=>
#     {
#       :size=>"23G",
#       :used=>"3.1G",
#       :avail=>"20G",
#       :used_percentage=>"14%",
#       :mount=>"/virtualbox"
#     }
# }