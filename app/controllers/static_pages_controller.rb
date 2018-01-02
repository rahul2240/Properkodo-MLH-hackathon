class StaticPagesController < ApplicationController

include HTTParty
require 'rubygems'
require 'nokogiri'
require 'rest-client'

  def home
=begin
    @username = params[:username]
        if @username
            @data = HTTParty.get('https://api.github.com/users/'+ @username)
            @language = Hash.new(0)
            a = 1
            stop = 0
            while(stop==0)
            @url = HTTParty.get('https://api.github.com/users/'+ @username +'/repos?page='+ a.to_s)
            if @url.count<30
              stop=1
            end

            @url.each do |repo|
              if repo['language']!=nil
                x = repo['language'].downcase
                @language[x] += 1
              end
             end

             a+=1
           end
         end
=end

             @codechef = Nokogiri::HTML(RestClient.get("https://www.codechef.com/users/rahul2240"))
             @d=Array.new
             i_count=0
             @codechef.xpath("//div[@class='content']/h5").each do |x|
              aword = x.text.split(" ")
               aword[2].slice! "("
               aword[2].slice! ")"
               @d[i_count] = aword[2].to_i
               i_count+=1
             end

             @codeforce = HTTParty.get("http://codeforces.com/api/user.info?handles=DmitriyH")

       end


end
