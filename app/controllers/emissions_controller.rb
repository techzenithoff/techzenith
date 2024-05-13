class EmissionsController < ApplicationController

 before_action :authenticate_account! , except: [:show, :archives, :list]
  before_action :set_emission, only: %i[ show edit update destroy ]

  layout "admin"
  add_breadcrumb "Accueil", :root_path
  add_breadcrumb "Emissions", :list_emissions_path

  # GET /emissions or /emissions.json
  def index
    @emissions = Emission.all
  end

  def archives
    @emission_category = EmissionCategory.friendly.find(params[:slug])
    puts "CATEGORY: #{@emission_category.inspect}"
    @emissions = Emission.where(emission_category_id: @emission_category.id ).order(id: :desc).paginate(:page => params[:page], :per_page => 6)
    

    add_breadcrumb @emission_category.title

    render layout: "front"
  end

  def list
    @emissions = Emission.paginate(:page => params[:page], :per_page => 12)
    
    add_breadcrumb "Émissions" if !action_name=="list"
    render layout: "front"
  end


  # GET /emissions/1 or /emissions/1.json
  def show

    @videos =  @emission.videos.where.not(title: "Private video").reorder(published_at: :desc).paginate(:page => params[:page], :per_page => 16)
    
    
    #puts "VIDEOS :#{@videos.items.inspect}"
    add_breadcrumb @emission.title

    render layout: "front"
  end

  # GET /emissions/new
  def new
    @emission_categories = EmissionCategory.all
    @emission = Emission.new
  end

  # GET /emissions/1/edit
  def edit
    @emission_categories = EmissionCategory.all
  end

  # POST /emissions or /emissions.json
  def create
    @emission = current_account.emissions.build(emission_params)

    respond_to do |format|
      if @emission.save
        format.html { redirect_to emissions_path, notice: "Emission was successfully created." }
        format.json { render :show, status: :created, location: @emission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emissions/1 or /emissions/1.json
  def update
    respond_to do |format|
      if @emission.update(emission_params)
        format.html { redirect_to emissions_path, notice: "Emission was successfully updated." }
        format.json { render :show, status: :ok, location: @emission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emission.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
      @emission = Emission.friendly.find(params[:emission_id])
    end

  # DELETE /emissions/1 or /emissions/1.json
  def destroy
    @emission.destroy

    respond_to do |format|
      format.html { redirect_to emissions_url, notice: "Emission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emission
      @emission = Emission.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emission_params
      params.require(:emission).permit(:emission_category_id,  :title, :content, :youtube_playlist_id, :thumbnail)
    end
end
