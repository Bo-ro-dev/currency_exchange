class ExchangeController < ApplicationController

  def show
    if params[:ref_currency] != nil
    request = RateFetcher.new(params[:ref_currency], params[:rel_currency])
    ratio = request.request_for
    @rel_amount = params[:ref_amount].to_i * ratio
    else
    end
  end
end
