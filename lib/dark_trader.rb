require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  crypto_name = []
  crypto_symbol = []
  crypto_price = []

  # page.css('tr.cmc-table-row  > td:nth-child(3) > div:nth-child(1) > a:nth-child(2)').each do |name|
  #   crypto_name.push(name.content)
  # end

  page.css('tr.cmc-table-row  > td:nth-child(3) > div').each do |symbol|
    crypto_symbol.push(symbol.content)
  end

  page.css('tr.cmc-table-row  > td:nth-child(5) > a').each do |price|
    crypto_price.push(price.content)
  end

  presentation = Hash[crypto_symbol.zip(crypto_price)]

  presentation.each do |symbol, price|
    puts symbol + " : " + price
  #  print crypto_name
  end
end

crypto_scrapper