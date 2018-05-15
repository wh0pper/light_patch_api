class StatesController < ApplicationController

  def index
    configs = State.all
    render json: configs, status: :ok
  end

  def update
    state = State.find(params[:id])
    if state.update!(state_params)
      render status: 200, json: {
        message: "State updated"
      }
    end
  end

  def test_blink
    state = State.where(active: true).first
    Thread.new do
      strip = Apa102Rbpi.strip
      loop do
        strip.set_pixel!(0, 0xffffff)
        sleep 1
        strip.set_pixel!(0, 0)
        sleep 1
      end
    end
    render json: state
  end

  def test_show
    state = State.where(active: true).first
    strip = Apa102Rbpi.strip
    strip.set_all_pixels!(0xf442df)
    render json: state
  end


  def active_state
    state = State.where(active: true).first
    render json: state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :mode, :color, :brightness)
  end

end
