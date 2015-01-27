class PagesController < ApplicationController

  before_filter :require_login

  layout :resolve_layout
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

  def resolve_layout
      case action_name
      when "faq", "help"
        "main"
      else
        "application"
      end
  end
end
