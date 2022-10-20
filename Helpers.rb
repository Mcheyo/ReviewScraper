require 'typhoeus'
require './Review.rb'
require 'pry' 
require 'json'
require 'nokogiri'
require 'jsoner'

def fetch(url)
 request = Typhoeus::Request.new(url, followlocation: true)
 
 request.on_complete do |response| 
    
    if response.success?
        parse(Typhoeus.get(url))
    elsif response.timed_out? 
        log("request timed out")
    elsif response.code == 0 
      log(response.return_message)
    else 
        log("HTTP request failed:" + response.code.to_s)
    end
   end

   request.run
end 



def parse(url)
reviews = []
html = url.body 
doc = Nokogiri::HTML(html)

if doc.xpath("//div[contains(@class, 'mainReviews')]").empty?
    puts "Please enter a valid buisness url page"
else
doc.xpath("//div[contains(@class, 'mainReviews')]").each do |review|
    
     title = review.xpath(".//p[contains(@class, 'reviewTitle')]").text
     text = review.xpath(".//p[contains(@class, 'reviewText')]").text
     author = review.xpath(".//p[contains(@class, 'consumerName')]").text.strip
     date = review.xpath(".//p[contains(@class, 'consumerReviewDate')]").text.strip
     star_rating = review.xpath(".//div[contains(@class, 'numRec')]").text.strip
     reviews.push(Review.new(title, text,author,date,star_rating))
    end
    
    p reviews.first
 end 
end 


