module LEDFunctions
  @@threads = []

  def self.render(state)
    self.thread_check
    @strip = Apa102Rbpi::Strip.new([0,75])
    # will add cases beyond MVP to choose lighting modes
    case state.mode
    when "blink"
      self.blink(state.color)
    when "solid"
      self.one_color(state.color)
    else
      puts 'no mode set'
    end
  end

  def self.blink(color)
    if @strip #safeguard for test routes, which don't go through render
      @strip.clear!
    else
      @strip = Apa102Rbpi::Strip.new([0,75])
    end
    @@threads << Thread.new do
      self.thread_check
      loop do
        @strip.set_all_pixels!(color.hex)
        sleep 1
        @strip.set_all_pixels!(0)
        sleep 1
      end
    end
  end

  def self.one_color(color)
    if @strip #safeguard for test routes, which don't go through render
      @strip.clear!
    else
      @strip = Apa102Rbpi::Strip.new([0,75])
    end
    self.thread_check
    puts @strip.set_all_pixels!(color.hex)
  end

  private

  def self.thread_check
    @@threads.each do |thread|
      thread.exit unless thread == Thread.current
    end
  end
end
