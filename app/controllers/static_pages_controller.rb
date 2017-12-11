class StaticPagesController < ApplicationController
    require 'flickraw'
    
    def home
        @photo_urls = []
        FlickRaw.api_key = ENV["flickr_api_key"]
        FlickRaw.shared_secret = ENV["flickr_secret"]
        @user_id = params[:user_id]
        unless params[:user_id].blank?
            photos = flickr.photos.search :user_id =>  @user_id
            photos.each do |photo|
                @photo_urls << "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
            end
        end
        
        
    end
end
