class PagesController < ApplicationController
  before_action :authenticate_account!, except: [:show, :contact_us, :pmu_mali, :matches, :about_us]
  before_action :set_page, only: %i[ show edit update destroy ]
  
  add_breadcrumb "Accueil", :root_path
  #layout "admin", except: [:show_page_path]
  

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1 or /pages/1.json
  def show
    #add_breadcrumb @page.title, show_page_path(@page)
    #@page_title = @page.title
    #@page_description = "Les articles de blog pour trouver des offres de stage au mali."

    render layout: "front"
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  def pmu_mali

    
    @last_pmu_race_report = PmuRaceReport.order(race_date: :asc).last
    
    add_breadcrumb "PMU Mali"
    render layout: "pmu"
  end

  def contact_us
    
    render layout: "front"
  end

  def about_us
    add_breadcrumb "A propos"
    render layout: "front"
  end

  def matches

   @competition_name = params[:competition]

    competition = Competition.find_by(code: params[:competition])
   
    if competition.present?
      @matches = competition.matches.reorder(match_id: :desc).paginate(:page => params[:page], :per_page => 12)
    else
      @matches = []
    end

    add_breadcrumb "Resultats matchs"
    render layout: "front"
  end

  # POST /pages or /pages.json
  def create
    @page = current_account.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_path, notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
      #@page = Page.friendly.find(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:uid, :slug, :title, :content, :status, :account_id)
    end
end

