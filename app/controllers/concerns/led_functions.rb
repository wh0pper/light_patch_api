
module LEDFunctions
  @@threads = []
  @strip = Apa102Rbpi.strip

  def self.render(color, mode, brightness)
    self.thread_check
    case mode
    when 'solid'
      @strip.set_all_pixels!(color, brightness)
    when 'blink'
      @@threads << Thread.new do
        loop do
          @strip.set_all_pixels!(color, brightness)
          sleep 1
          @strip.set_all_pixels!(0)
          sleep 1
        end
      end
    when 'pulse'
      @@threads << Thread.new do
        max = brightness
        current = brightness
        loop do
          if current < max
            current += 1
          elsif current > 0
            current -= 1
          end
          @strip.set_all_pixels!(color, current)
          sleep 0.1
        end
      end
    when 'marquee'
      @@threads << Thread.new do
        i = 0
        loop do
          @strip.set_pixel!(i, color, brightness)
          @strip.set_pixel!(i+1, color, brightness)
          @strip.set_pixel!(i+2, color, brightness)
          if i<145
            i += 1
          else
            i = 0
          end
        end
      end
    end
  end

  def self.off
    self.thread_check
    @@threads = []
    @strip.set_all_pixels(0)
  end

  def self.blink
    self.thread_check
    @@threads << Thread.new do
      # strip = Apa102Rbpi.strip
      loop do
        @strip.set_all_pixels!(0xffffff)
        sleep 1
        @strip.set_all_pixels!(0)
        sleep 1
      end
    end
  end

  def self.one_color(color)
    self.thread_check
    @strip.set_all_pixels!(color)
  end

  private
  def self.thread_check
    @@threads.each do |thread|
      thread.exit
    end
  end
end
