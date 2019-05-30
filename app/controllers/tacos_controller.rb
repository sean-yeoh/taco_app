class TacosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  before_action :set_taco, only: [:destroy]

  def index
    @tacos = Taco.all.order(id: :asc)
  end

  def create
    @taco = Taco.new(taco_params)
    if @taco.save
      render json: {
        id: @taco.id, meat: @taco.meat, rice: @taco.rice, salsa: @taco.salsa,
        coleslaw: @taco.coleslaw, notes: @taco.notes, price: ActionController::Base.helpers.humanized_money_with_symbol(@taco.price)
      }
    else
      render json: { error_messages: @taco.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def destroy
    @taco.destroy
  end

  private
  def taco_params
    params.require(:taco).permit(:meat, :rice, :salsa, :notes, :coleslaw)
  end

  def set_taco
    @taco = Taco.find(params[:id])
  end
end