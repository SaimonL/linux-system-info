require 'spec_helper'

describe 'With connection info' do
  before(:all) do
    @connection = LinuxSystemInfo.connection
  end

  describe 'the returned value' do
    it 'will have proper ips' do
      expect(@connection.first.last.length).to eq 5
    end

    it 'will have proper mac address' do
      expect(@connection.first.last[:mac]).to match /([a-z]|\d|:)+/
    end

    it 'will have proper ip address' do
      expect(@connection.first.last[:ip]).to match /(\d|\.)+/
    end

    it 'will have proper mask' do
      expect(@connection.first.last[:mask]).to match /(\d|\.)+/
    end

    it 'will have proper broadcast' do
      expect(@connection.first.last[:broadcast]).to match /(\d|\.)+/
    end
  end
end