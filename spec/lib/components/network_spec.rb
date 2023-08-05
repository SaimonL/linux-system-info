require 'spec_helper'

describe 'With network info' do
  before(:all) do
    @network = LinuxSystemInfo.network
  end

  describe 'the returned value' do
    it 'will have one or more network' do
      expect(@network.length).to be > 0
    end

    it 'will have network indo' do
      expect(@network.first).to_not be_nil
    end
  end
end