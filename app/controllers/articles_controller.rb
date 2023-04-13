class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  include SearchesHelper

  # GET /articles or /articles.json
  def index
    if params[:query].present?
      @articles = Article.where('lower(title) Like ?', "%#{params[:query].downcase}%").paginate(per_page: 10,
                                                                                                page: params[:page])
      create_search(params[:query], current_user.id)
    else
      @articles = Article.paginate(per_page: 10, page: params[:page])
    end
  end

  # GET /articles/1 or /articles/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def create_search(query, user_id)
    return unless query.present? && query.length >= 3

    new_query = Search.where(user_id:, confirmed: false).last

    if new_query && params[:confirmed].present?
      new_query.update(confirmed: true)
    elsif new_query && same_input?(query, new_query.query)
      new_query.update(query:)
    else
      Search.create(query:, user_id:)
    end
  end
end
