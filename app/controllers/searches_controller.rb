class SearchesController < ApplicationController
  def index
    @results = Search.find(params[:query])
  end
end
