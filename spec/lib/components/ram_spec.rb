require 'spec_helper'

describe 'With memory info' do
  before(:all) do
    @ram = LinuxSystemInfo.memory
  end

  describe 'the returned value' do
    it 'will have measurement unit' do
      expect(@ram[:unit]).to eq 'Megabyte'
    end

    it 'will have valid total' do
      expect(@ram[:total].to_i).to be > 64
    end

    it 'will have valid used' do
      expect(@ram[:used].to_i).to be > 64
    end

    it 'will have valid free' do
      expect(@ram[:free].to_i).to be >= 0
    end

    it 'will have valid shared' do
      expect(@ram[:shared].to_i).to be >= 0
    end

    it 'will have valid buffers' do
      expect(@ram[:buffers].to_i).to be >= 0
    end

    it 'will have valid cached' do
      expect(@ram[:buffers].to_i).to be >= 0
    end
  end
end