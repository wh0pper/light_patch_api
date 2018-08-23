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

  def create
    State.all.each { |state| state.update!(active: false) }
    new_state = State.create!(state_params)
    LEDFunctions.render(new_state)
    render json: new_state, status: 201, message: "New state created."
  end

  def update
    state = State.find(params[:id])
    if state.update!(state_params)
      LEDFunctions.one_color(state.color)
      render status: 200, json: {
        message: "State updated."
      }
    end
  end

  def destroy
    LEDFunctions.off
  end

  def test_blink
    state = State.where(active: true).first
    LEDFunctions.blink
    render json: state
  end

  def test_pink
    color = 0xf442df
    state = State.where(active: true).first
    LEDFunctions.one_color(color)
    render json: state
  end

  def send_values
    color = params[:color] ? Integer(params[:color]) : 0xf442df
    mode = params[:mode] ? params[:mode] : 'solid'
    brightness = params[:brightness] ? params[:brightness] : 31
    state = State.where(active: true).first
    LEDFunctions.render(color, mode, brightness)
    render json: state
  end

  def active_state
    state  = State.where(active: true).first ? State.where(active: true).first : State.first
    LEDFunctions.one_color(state.color)
    render json: state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :name, :mode, :color, :brightness)
  end

end
