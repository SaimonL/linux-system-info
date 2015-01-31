require 'spec_helper'

describe 'With usb info' do
  before(:all) do
    @usb = LinuxSystemInfo.usb
  end

  describe 'the returned value' do
    it 'will have one or more usb' do
      expect(@usb.length).to be > 0
    end

    it 'will have usb indo' do
      expect(@usb.first).to_not be_nil
    end
  end
end