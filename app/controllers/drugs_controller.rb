class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout
  # GET /drugs
  # GET /drugs.json
  def index
    @search = Drug.search do
      fulltext params[:search]
    end
    @drugs = @search.results

  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show


    @ingredients = Ingredient.all
    @relationship = Relationship.new  

    @allowed_array = Ingredient.where(id: Relationship.where(drug_id: @drug.id).all.map(&:ingredient_id)).all.map(&:allowed)  

  end

    

  # GET /drugs/new
  def new
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def query
    search = Drug.search do
      fulltext params[:q]
    end
 
    respond_to do |format|
      format.json do
        results = search.results.map do |drug|
          { name: drug.name, link: "http://localhost:3000/drugs/#{drug.id}" }
        end
        render json: results
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:name, :description)
    end

    def resolve_layout
      case action_name
      when "show", "index"
        "main"
      else
        "application"
      end
    end
end
