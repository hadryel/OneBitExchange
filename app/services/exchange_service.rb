require 'rest-client'
require 'json'
 
class ExchangeService
  def initialize(source_currency, target_currency)
    @source_currency = source_currency
    @target_currency = target_currency
  end
 
 
  def perform
    begin
      exchange_api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
      exchange_api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]
      url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
      res = RestClient.get url
      ratio = JSON.parse(res.body)['currency'][0]['value'].to_f

      ratio
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end