class VideosController < ApplicationController

    def index
        @videos = Video.offset(params[:offset]).limit(params[:limit])
        render json: { meta: {total: Video.count},
                       videos: @videos.as_json(include: {:category =>{only: [:name,:id] }}, only: [:title,:description,:video, :category] )
                    }, status: :ok
    end

    def show
        @video = Video.find(params[:id])
        render json: @video.as_json(include: {:category =>{only: [:name,:id] }}, only: [:title,:description,:video, :category] ), status: :ok
    end

    def create
       @video = Video.create!(video_create_params)
       render :json =>  @video.as_json(include: {:category =>{only: [:name,:id] }}, only: [:title,:description,:video, :category] ), status: :ok
    end

    def activate
        @video = Video.find(video_update_params[:id])
        @video.active = true
        @video.save
    end

    def deactivate
        @video = Video.find(video_update_params[:id])
        @video.active = false
        @video.save
    end

    def video_create_params
        params.permit(:title,:video, :description, :category_id)
    end

    def video_update_params
        params.require(:id)
    end
end
