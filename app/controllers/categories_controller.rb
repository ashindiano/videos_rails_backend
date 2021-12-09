class CategoriesController < ApplicationController
    protect_from_forgery with: :exception
    
    def index
        @categories = Category.all
        render :json => @categories
    end
end
