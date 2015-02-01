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

  def viewdrugs
    require_admin
    @search = Drug.search do
      fulltext params[:search]
      paginate(:page => params[:page] || 1, :per_page => 10)
    end
    @drugs = @search.results


  end

  def viewingredients
    require_admin
    @ingredients = Ingredient.all.paginate(:page => params[:page], :per_page => 5)

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
