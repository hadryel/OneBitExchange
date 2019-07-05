class ExchangesController < ApplicationController
  def index
    @ratio = ExchangeService.new(params[:source_currency], params[:target_currency]).perform
  end

  def convert
    ratio = ExchangeService.new(params[:source_currency], params[:target_currency]).perform
    render json: {"ratio": ratio}
  end
end
