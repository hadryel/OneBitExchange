require 'spec_helper'
require 'json'
require './app/services/exchange_service'
 
describe 'Currency' do
  it 'exchange' do
    res = ExchangeService.new("USD", "BRL").perform
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0).to eql(true)
  end
end