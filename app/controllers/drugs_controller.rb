class DrugsController < ApplicationController

  before_filter :require_login

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
    require_admin
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
    require_admin
  end

  # POST /drugs
  # POST /drugs.json
  def create
    require_admin
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
    require_admin
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
    require_admin
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

  def importcsv
    csv = Roo::Spreadsheet.open(params[:file].path, :extension => :csv )

    csv.each do |item| 
   
      if Drug.find_by(name: item[0].to_s).nil?
         Drug.create!(name: item[0].to_s)

         unless item[1].nil?
           if Ingredient.find_by(name: item[1].to_s).nil?
             Ingredient.create!(name: item[1], allowed: 'yes')
           end
         end

         unless item[2].nil?
          ingredients_array_1 = item[2].split('+')

            ingredients_array_1.each do |ingr|
              if Ingredient.find_by(name: ingr.to_s).nil?
                Ingredient.create!(name: ingr.to_s, allowed: 'yes')
              end
            end
         end

         unless item[3].nil?
          removestring = item[3].sub(/(\s([A-Z]|INF)\s([A-Z]|\d)-[A-Z](.*)\z)|(\s\d(.*)\z)/, '')
          splitstring = removestring.split('+')

          if splitstring.class == Array
            splitstring.each do |ingr2|
              if Ingredient.find_by(name: ingr2).nil?
                Ingredient.create!(name: ingr2, allowed: 'yes')
              end
            end 

            else
              if Ingredient.find_by(name: splitstring).nil?
                Ingredient.create!(name: splitstring, allowed: 'yes')
              end
          end

         end

      end 

    end

    redirect_to viewdrugs_path, notice: "CSV imported."
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
