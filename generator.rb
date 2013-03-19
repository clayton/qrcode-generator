require 'rqrcode_png'
require 'chunky_png'
require 'uri'

class Generator
  def initialize(url)
    @url = url
    @uri = URI.parse(url)
  end

  def generate
    qr = RQRCode::QRCode.new( @url, :size => 10, :level => :h )
    png = qr.to_img
    file_name = @uri.path.downcase.slice(1,@uri.path.length).gsub("/", "-")
    png.resize(400, 400).save("#{file_name}.png")
  end
end
