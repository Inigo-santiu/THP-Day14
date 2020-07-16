require_relative "../lib/dark_trader"

describe 'crypto_scrapper' do
  it 'Finds the Cryptocurrency symbol and its corresponding value' do
    expect(crypto_scrapper).not_to be_nil

  end
end
