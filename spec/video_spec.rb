require 'spec_helper'

describe 'With video info' do
  before(:all) do
    @video = LinuxSystemInfo.video
  end

  describe 'the returned value' do
    it 'will have hard drives' do
      expect(@video.size).to be >= 1
    end

    it 'will detect correct device' do
      expect(@video.first).to match /(Radeon|HD|VGA|Graphics Controller)/
    end
  end
end