class TacosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :delete]
  before_action :set_taco, only: [:show, :delete]
  def index
    @tacos = Taco.all
  end

  def create
    @taco = Taco.new(taco_params)
    if @taco.save
      render json: @taco
    else
      render json: @taco.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @taco.destroy
  end

  private
  def taco_params
    params.require(:taco).permit(:meat, :rice, :salsa, :notes)
  end

  def set_taco
    @taco = Taco.find(params[:id])
  end
end