class StatesController < ApplicationController
  include LEDFunctions
  def index
    configs = State.all
    render json: configs, status: :ok
  end

  def show
    state = State.find(params[:id])
    render json: state, status: :ok
<<<<<<< HEAD
=======
  end

  def create
    State.all.each { |state| state.update!(active: false) }
    new_state = State.create!(state_params)
    LEDFunctions.render(new_state)
    render json: new_state, status: 201, message: "New state created."
>>>>>>> a522d3e8ec9618af8d33e05c32fd3e418b3e626c
  end

  def update
    state = State.find(params[:id])
    if state.update!(state_params)
<<<<<<< HEAD
      LEDFunctions.render(state)
      # LEDFunctions.one_color(state.color)
=======
      LEDFunctions.one_color(state.color)
>>>>>>> a522d3e8ec9618af8d33e05c32fd3e418b3e626c
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
<<<<<<< HEAD

  def active_state
    state  = State.where(active: true).first ? State.where(active: true).first : State.first
    # LEDFunctions.one_color(state.color)
=======

  # Actions written for testing purposes:
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
    state  = State.where(active: true).first ? State.where(active: true).first : State.first
    LEDFunctions.one_color(state.color)
>>>>>>> a522d3e8ec9618af8d33e05c32fd3e418b3e626c
    render json: state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :name, :mode, :color, :brightness)
  end

end
