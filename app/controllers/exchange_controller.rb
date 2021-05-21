class ExchangeController < ApplicationController

  def show
    if params[:ref_amount]
      ratio = RatioFetcher.request_for(params[:ref_currency], params[:rel_currency])
      @rel_amount = params[:ref_amount].to_i * ratio
    else
    end
  end
end
