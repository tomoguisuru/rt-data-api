class RollsController < ApplicationController
  before_action :set_roll, only: [:show, :update, :destroy]

  def create
    @roll = Roll.create!(roll_params)
  end

  private


  def roll_params
    # whitelist params
    params.permit(:value)
  end

  def set_roll
    @todo = Roll.find(params[:id])
  end
end
