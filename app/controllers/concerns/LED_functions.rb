module LEDFunctions
  @@threads = []

  def self.blink
    @@threads << Thread.new do
      strip = Apa102Rbpi.strip
      loop do
        strip.set_pixel!(0, 0xffffff)
        sleep 1
        strip.set_pixel!(0, 0)
        sleep 1
      end
    end
  end

  def self.one_color(color)
    strip = Apa102Rbpi.strip
    strip.set_all_pixels!(color)
  end
end
