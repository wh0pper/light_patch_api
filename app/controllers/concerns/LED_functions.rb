module LEDFunctions
  @@threads = []

  def self.render(state)
    self.thread_check
    brightness = state.brightness * 31
    @strip = Apa102Rbpi::Strip.new([0,50],
      {
        brightness: brightness
      }
    )
    # will add cases beyond MVP to choose lighting modes
    case state.mode
    when "blink"
      self.blink(state.color)
    # when "transition"
    # when "pulse"
    # when "solid"
    else
      self.one_color(state.color)
    end
  end

  def self.blink(color)
    self.thread_check
    @@threads << Thread.new do
      # strip = Apa102Rbpi.strip
      loop do
        @strip.set_all_pixels!(color)
        sleep 1
        @strip.set_all_pixels!(0)
        sleep 1
      end
    end
  end

  def self.one_color(color)
    self.thread_check
    # strip = Apa102Rbpi.strip
    @strip.set_all_pixels!(color.hex)
  end

  private

  def self.thread_check
    @@threads.each do |thread|
      thread.exit unless thread == Thread.current
    end
  end
end
