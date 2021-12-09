class VideosController < ApplicationController

    def index
        @videos = Video.offset(params[:offset]).limit(params[:limit])
        render json: @videos, include: ['category'], meta: { total: Video.count }
    end

    def show
        @video = Video.find(params[:id])
        render json: @video, status: :ok
        rescue ActiveRecord::RecordNotFound => e
            render json: {
                error: e.to_s
            }, status: :not_found
    end

    def create
       @video = Video.create(video_create_params)
       render :json =>  @video, status: :ok
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
        params.permit(:title,:video, :description, :category_id)
    end

    def video_update_params
        params.require(:id)
    end
end
