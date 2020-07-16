require 'rubygems'
require 'nokogiri'
require 'open-uri'     


def deputies
  page_nationale_assembly = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  deputies_length = page_nationale_assembly.css('[@id="deputes-list"]').css('li').css('a').length
  deputies_name = []
  page_nationale_assembly.css('[@id="deputes-list"]').css('li').css('a').each do |i|
  deputies_name << i.text
  end
  deputies_name.each do |i|
    i.delete_prefix!("M. ")
  end
  deputies_name.each do |i|
    i.delete_prefix!("Mme ")
  end
  deputies_name_array = deputies_name.map{|x| x.to_s.split}

  p deputies_name_array
  end
  
deputies