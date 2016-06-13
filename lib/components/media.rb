module LinuxSystemInfo
  class << self
    def video
      data = Array.new
      video = `lspci`
      # Graphics Controller
      videos = video.split("\n").grep /(VGA|Graphics Controller)/
      videos.each do |video|
        video = video.split(':')
        data.push video[2].strip
      end
      data
    end

    def audio
      data = Array.new
      audio = `lspci`
      audios = audio.split("\n").grep /Audio/
      audios.each do |audio|
        audio = audio.split(':')
        data.push audio[2].strip
      end
      data
    end
  end
end