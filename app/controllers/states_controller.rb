class StatesController < ApplicationController
  include LEDFunctions
  def index
    configs = State.all
    render json: configs, status: :ok
  end

  def create
    State.all.each { |state| state.update!(active: false) }
    new_state = State.create!(state_params)
    render json: new_state, status: 201, message: "New state created."
  end

  def update
    state = State.find(params[:id])
    LEDFunctions.render(state)
    if state.update!(state_params)
      render status: 200, json: {
        message: "State updated"
      }
    end
  end
  #
  # def test_blink
  #   state = State.where(active: true).first
  #   LEDFunctions.blink
  #   render json: state
  # end
  #
  # def show_color
  #   state = State.where(active: true).first
  #   LEDFunctions.one_color(0xf442df)
  #   render json: state
  # end

  def active_state
    state = State.where(active: true).first
    render json: state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :name, :mode, :color, :brightness)
  end

end
