require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  email = Nokogiri::HTML(URI.open(townhall_url))
  email_array = []
  cities_array = []

  email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |avernes| 
    email_array << avernes.text
  email.xpath('/html/body/div/main/section[1]/div/div/div/h1').each do |cities|
      cities_array << cities.text
    
    presentation = Hash[cities_array.zip(email_array)]
    print presentation
    end
  end
end

def get_townhall_urls
  mayoral_page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  valdoise_array = []
  mayoral_page.xpath('//p/a/@href').each do |villes|
    villes_url = "https://www.annuaire-des-mairies.com" + villes.text.delete_prefix(".")
    valdoise_array << villes_url
    end
  return valdoise_array
end

def execute
  get_townhall_urls
  get_townhall_urls.each do |url|
  get_townhall_email(url)
  end
end

execute