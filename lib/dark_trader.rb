require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

  crypto_symbol = []
  crypto_price = []


  page.css('tr.cmc-table-row  > td:nth-child(3) > div').each do |symbol|
    crypto_symbol.push(symbol.content)
  end

  page.css('tr.cmc-table-row  > td:nth-child(5) > a').each do |price|
    crypto_price.push(price.content)
  end

  presentation = Hash[crypto_symbol.zip(crypto_price)]

  presentation.each do |symbol, price|
    puts symbol + " : " + price
  #  print crypto_name    <-- To try and put a 3rd column
  end
end

crypto_scrapper