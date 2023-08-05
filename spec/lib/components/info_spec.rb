require 'spec_helper'

describe 'With info' do
  before(:all) do
    @os = LinuxSystemInfo.info
  end

  describe 'the returned value' do
    it 'will have valid list' do
      expect(@os.length).to be == 3
    end

    it 'will have os' do
      expect(@os.first).to_not be_nil
    end

    it 'will have valid uptime' do
      expect(@os[:uptime]).to match /\d+:\d+:\d+ up/
    end

    it 'will have valid users count' do
      expect(@os[:users].to_i).to be >= 0
    end
  end
end