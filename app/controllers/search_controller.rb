class SearchController < ApplicationController
  def search
    @search = Book.ransack(params[:q])
    @results = @search.result
  end

  
end
