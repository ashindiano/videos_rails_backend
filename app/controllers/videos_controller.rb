class VideosController < ApplicationController

    def index
        @videos = Video.all
        render :json => @videos
    end

    def create
       @video = Video.create(title: params[:title], description: params[:description], video: params[:video], category_id: params[:category_id])
       render :json =>  @video
    end

    def activate
        video = Video.find(video_update_params[:id])
        video.active = true
        video.save
    end

    def deactivate
        video = Video.find(video_update_params[:id])
        video.active = false
        video.save
    end

    def video_create_params
        params
    end

    def video_update_params
        params.require(:id)
    end
end
