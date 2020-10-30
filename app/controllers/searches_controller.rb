# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    @searches = Search.all
    @search = @searches.last
    @reports = SearchService.query
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_path }
      else
        format.html { render :new }
      end
    end
  end

  private

  def search_params
    params.require(:search).permit(:term)
  end
end
