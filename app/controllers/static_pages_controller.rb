class StaticPagesController < ApplicationController

include HTTParty
require 'rubygems'
require 'nokogiri'
require 'rest-client'

  def home
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
         

       end


end
