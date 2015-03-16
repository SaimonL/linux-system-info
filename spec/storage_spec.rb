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
      expect(@storage.first.last[:size]).to match /\d+(T|G|M|K)/
    end

    it 'will have valid used' do
      expect(@storage.first.last[:used]).to match /\d+(T|G|M|K)/
    end

    it 'will have valid available' do
      expect(@storage.first.last[:available]).to match /\d+(T|G|M|K)/
    end

    it 'will have valid used_percentage' do
      expect(@storage.first.last[:used_percentage]).to match /\d+%/
    end

    it 'will have valid mount point' do
      expect(File.exist?(@storage.first.last[:mount])).to eq true
    end

  end
end