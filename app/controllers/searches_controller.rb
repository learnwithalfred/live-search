class SearchesController < ApplicationController
  def index
    @search_results = Search.where(user: current_user).group(:query).order(count: :desc).count
  end
end
