class PmuRaceProgramsController < ApplicationController
  before_action :set_pmu_race_program, only: %i[ show edit update destroy ]

  # GET /pmu_programs or /pmu_programs.json
  def index
    @pmu_race_programs = PmuRaceProgram.all
  end

  # GET /pmu_programs/1 or /pmu_programs/1.json
  def show
  end

  def scrape
    url = 'https://pmu.malijet.com/liste-programmes-pmu-mali.html'
    response = PmuPrograms.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  # GET /pmu_programs/new
  def new
    @pmu_race_program = PmuRaceProgram.new
  end

  # GET /pmu_programs/1/edit
  def edit
  end

  def list
    @pmu_race_programs = PmuRaceProgram.all
    render layout: "pmu"
  end

  # POST /pmu_programs or /pmu_programs.json
  def create
    @pmu_race_program = PmuRaceProgram.new(pmu_race_program_params)

    respond_to do |format|
      if @pmu_race_program.save
        format.html { redirect_to pmu_program_url(@pmu_race_program), notice: "Pmu program was successfully created." }
        format.json { render :show, status: :created, location: @pmu_race_program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pmu_race_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pmu_programs/1 or /pmu_programs/1.json
  def update
    respond_to do |format|
      if @pmu_race_program.update(pmu_race_program_params)
        format.html { redirect_to pmu_program_url(@pmu_race_program), notice: "Pmu program was successfully updated." }
        format.json { render :show, status: :ok, location: @pmu_race_program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pmu_race_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmu_programs/1 or /pmu_programs/1.json
  def destroy
    @pmu_race_program.destroy

    respond_to do |format|
      format.html { redirect_to pmu_programs_url, notice: "Pmu program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pmu_race_program
      @pmu_race_program = PmuRaceProgram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pmu_race_program_params
      params.require(:pmu_race_program).permit(:uid, :race_date, :race_type, :discipline, :distance)
    end
end
