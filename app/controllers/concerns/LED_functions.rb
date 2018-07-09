module LEDFunctions
  @@threads = []

  def self.render(state)
    self.thread_check
<<<<<<< HEAD
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
=======
    strip = Apa102Rbpi::Strip.new([0,50])
    strip.set_all_pixels(state.color.hex)
    # features to be implemented here: additional modes, max brightness, timer
    case state.mode
    when "blink"
      strip.
    # when "transition"
    # when "pulse"
    # when "solid"
    else
    end
  end

  # testing actions
  def self.blink
    self.thread_check
>>>>>>> a522d3e8ec9618af8d33e05c32fd3e418b3e626c
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
<<<<<<< HEAD
    puts @strip.set_all_pixels!(color.hex)
=======
    strip = Apa102Rbpi.strip
    strip.set_all_pixels!(color.hex)
>>>>>>> a522d3e8ec9618af8d33e05c32fd3e418b3e626c
  end

  private

  def self.thread_check
    @@threads.each do |thread|
      thread.exit unless thread == Thread.current
    end
  end
end
