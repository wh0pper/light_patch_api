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
        loop do
          @strip.set_all_pixels!(color, 10)
          sleep 1
          @strip.set_all_pixels!(color, 2)
          sleep 1
        end
      end
    end
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
