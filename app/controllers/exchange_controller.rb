class ExchangeController < ApplicationController

  def show
    if params[:ref_amount]
      rate = RatioFetcher.new(params[:ref_currency], params[:rel_currency])
      rate = rate.request_for
      render json: {
        from: params[:ref_currency],
        to: params[:rel_currency],
        rate: rate
      }
    else
    end
  end
end
