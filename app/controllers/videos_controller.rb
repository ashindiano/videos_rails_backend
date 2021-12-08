class VideosController < ApplicationController

    def index
        @videos = Video.all
        render :json => @videos
    end

    def create
       @video = Video.new
       @video.video = params[:file]
       @video.save
       render :json =>  @video
    end
end
