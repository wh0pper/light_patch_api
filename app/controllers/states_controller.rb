class StatesController < ApplicationController
  include LEDFunctions
  def index
    configs = State.all
    render json: configs, status: :ok
  end

  def show
    state = State.find(params[:id])
    render json: state, status: :ok
  end

  def update
    state = State.find(params[:id])
    if state.update!(state_params)
      LEDFunctions.render(state)
      # LEDFunctions.one_color(state.color)
      render status: 200, json: {
        message: "State updated."
      }
    end
  end

  def test_blink
    state = State.where(active: true).first
    LEDFunctions.blink('0xf442df')
    render json: state
  end

  def show_color
    state = State.where(active: true).first
    LEDFunctions.one_color('0xf442df')
    render json: state
  end

  def active_state
    state  = State.where(active: true).first ? State.where(active: true).first : State.first
    # LEDFunctions.one_color(state.color)
    render json: state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :name, :mode, :color, :brightness)
  end

end
