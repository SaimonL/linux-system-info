require 'spec_helper'

describe 'With cpu info' do
  before(:all) do
    @cpu = LinuxSystemInfo.cpu
  end

  describe 'the returned value' do
    it 'will have models' do
      expect(@cpu[:model].length).to eq 2
    end

    it 'will have model name' do
      expect(@cpu[:model][:name]).to_not be_empty
    end

    it 'will have model number' do
      expect(@cpu[:model][:number]).to_not be_empty
    end

    it 'will have address size' do
      expect(@cpu[:address_sizes]).to include 'bits'
    end

    it 'will have architecture' do
      expect(@cpu[:architecture]).to_not be_empty
    end

    it 'will have threads' do
      expect(@cpu[:threads].to_i).to be >= 0
    end

    it 'will have cores' do
      expect(@cpu[:cores].to_i).to be > 0
    end

    it 'will have socket' do
      expect(@cpu[:socket].to_i).to be > 0
    end

    it 'will have family' do
      expect(@cpu[:family]).to_not be_nil
    end

    it 'will have flags' do
      expect(@cpu[:flags]).to_not be_nil
    end

    it 'will have L1d' do
      expect(@cpu[:L1][:d]).to match /\d+K/
    end

    it 'will have L1i' do
      expect(@cpu[:L1][:i]).to match /\d+K/
    end

    it 'will have L2' do
      expect(@cpu[:L2]).to match /\d+K/
    end

    it 'will have L3' do
      expect(@cpu[:L3]).to match /\d+K/
    end
  end
end