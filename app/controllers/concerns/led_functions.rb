module LEDFunctions
  @@threads = []
  @strip = Apa102Rbpi.strip

  def self.render(color, mode)
    self.thread_check
    case mode
    when 'solid'
      @strip.set_all_pixels!(color)
    when 'blink'
      @@threads << Thread.new do
        loop do
          @strip.set_all_pixels!(color)
          sleep 1
          @strip.set_all_pixels!(0)
          sleep 1
        end
      end
	when 'pulse'
	  brightness = 31
      @@threads << Thread.new do
        loop do
          @strip.set_all_pixels!(color, brightness)
          #sleep 1
          if brightness == 0
            direction = 1
          elsif brightness == 31
            direction = -1
          end
          brightness += direction
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
