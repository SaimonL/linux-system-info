require 'spec_helper'

describe 'With users info' do
  before(:all) do
    @users = LinuxSystemInfo.users
  end

  describe 'the returned value' do
    it 'will have one or more users' do
      expect(@users.length).to be > 0
    end

    it 'will have root user' do
      expect(@users)
        .to include({
                      account: 'root',
                      info: { full_name: nil, room_number: nil, work_phone: nil, home_phone: nil, other: nil},
                      uid: 0,
                      gid: 0,
                      home: '/root',
                      shell: '/bin/bash'
                    })
    end
  end
end
