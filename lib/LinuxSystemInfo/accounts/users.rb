module LinuxSystemInfo
  class << self
    def users
      data = []
      all_users = `cat /etc/passwd`.split("\n")

      all_users.each do |each_user|
        data << extract_user(each_user)
      end

      data
    end

    private

      def extract_user(data)
        user = data.split(':')

        {
          account: user[0],
          uid: user[2]&.to_i,
          gid: user[3]&.to_i,
          info: extract_user_info(user[4]),
          home: user[5],
          shell: user[6]
        }
      end

      def extract_user_info(data)
        info = data&.split(',')

        if info.empty? || info.count == 1
          { full_name: nil, room_number: nil, work_phone: nil, home_phone: nil, other: nil }
        else
          { full_name: info[0], room_number: info[1], work_phone: info[2], home_phone: info[3], other: info[4] }
        end
      end
  end
end
