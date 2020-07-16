require 'rubygems'
require 'nokogiri'
require 'open-uri'

def mailing_list
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/'))