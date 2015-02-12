require 'spec_helper'

describe 'With audio info' do
  before(:all) do
    @audio = LinuxSystemInfo.audio
  end

  describe 'the returned value' do
    it 'will have hard drives' do
      expect(@audio.size).to be >= 1
    end

    it 'will detect correct device' do
      expect(@audio.first).to match /(Audio)/
    end
  end
end