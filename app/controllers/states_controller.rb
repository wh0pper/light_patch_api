class StatesController < ApplicationController
  def index
    @configs = State.all
    render json: @configs, status: :ok
  end

  def active_state
    @state = State.where(active: true).first
    render json: @state, status: :ok
  end

end
