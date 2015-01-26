class PagesController < ApplicationController

  before_filter :require_login

  def home
  	@search = Drug.search do
      fulltext params[:search]
    end
    @drugs = @search.results
  end

  def faq
  end

  def help
  end
end
