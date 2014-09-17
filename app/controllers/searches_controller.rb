class SearchesController < ApplicationController
  def index
    # @results = []
    @results = Search.find(params[:query])
  end
end
