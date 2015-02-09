class IngredientsController < ApplicationController
  before_filter :require_login
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  layout 'main'
  # GET /ingredients
  # GET /ingredients.json

  def index
    @search = Ingredient.search do
      fulltext params[:search]
    end
    @ingredients = @search.results
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    require_admin
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
    require_admin
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    require_admin
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    require_admin
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    require_admin
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def query
    search = Ingredient.search do
      fulltext params[:q]
    end
 
    respond_to do |format|
      format.json do
        results = search.results.map do |drug|
          { name: ingredient.name, link: "http://localhost:3000/ingredient/#{ingredient.id}" }
        end
        render json: results
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :allowed)
    end
end
