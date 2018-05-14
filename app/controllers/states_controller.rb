class StatesController < ApplicationController
  def index
    @configs = State.all
    render json: @configs, status: :ok
  end

  def update
    @state = State.find(params[:id])
    if @state.update!(state_params)
      render status: 200, json: {
        message: "State updated"
      }
    end
  end

  def active_state
    @state = State.where(active: true).first
    render json: @state, status: :ok
  end

  private
  def state_params
    params.permit(:active, :mode, :color, :brightness)
  end

end
