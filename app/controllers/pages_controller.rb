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

  def login
    redirect_to root_path
  end

  def viewdrugs
    require_admin
    @search = Drug.search do
      fulltext params[:search]
      paginate(:page => params[:page] || 1, :per_page => 100)
    end
    @drugs = @search.results


  end

  def viewingredients
    require_admin
    @search = Ingredient.search do
      fulltext params[:search]
      paginate(:page => params[:page] || 1, :per_page => 100)
    end
    @ingredients = @search.results

  end

  def resolve_layout
      case action_name
      when "faq", "help"
        "main"  
      when "viewdrugs", "viewingredients"
        "admin_layout"
      else
        "application"
      end
  end
end
