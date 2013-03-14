require 'rqrcode_png'
require 'chunky_png'

class Generator
  def initialize(url)
    @url = url
  end

  def generate
    qr = RQRCode::QRCode.new( @url, :size => 4, :level => :h )
    png = qr.to_img
    png.resize(400, 400).save("qr.png")
  end
end

Generator.new("http://google.com").generate
`open qr.png`