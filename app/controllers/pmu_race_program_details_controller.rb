class PmuRaceProgramDetailsController < ApplicationController
  before_action :set_pmu_race_program_detail, only: %i[ show edit update destroy ]

  # GET /pmu_race_program_details or /pmu_race_program_details.json
  def index
    @pmu_race_program_details = PmuRaceProgramDetail.all
  end

  # GET /pmu_race_program_details/1 or /pmu_race_program_details/1.json
  def show
  end

  # GET /pmu_race_program_details/new
  def new
    @pmu_race_program_detail = PmuRaceProgramDetail.new
  end

  # GET /pmu_race_program_details/1/edit
  def edit
  end

  # POST /pmu_race_program_details or /pmu_race_program_details.json
  def create
    @pmu_race_program_detail = PmuRaceProgramDetail.new(pmu_race_program_detail_params)

    respond_to do |format|
      if @pmu_race_program_detail.save
        format.html { redirect_to pmu_race_program_detail_url(@pmu_race_program_detail), notice: "Pmu race program detail was successfully created." }
        format.json { render :show, status: :created, location: @pmu_race_program_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pmu_race_program_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pmu_race_program_details/1 or /pmu_race_program_details/1.json
  def update
    respond_to do |format|
      if @pmu_race_program_detail.update(pmu_race_program_detail_params)
        format.html { redirect_to pmu_race_program_detail_url(@pmu_race_program_detail), notice: "Pmu race program detail was successfully updated." }
        format.json { render :show, status: :ok, location: @pmu_race_program_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pmu_race_program_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmu_race_program_details/1 or /pmu_race_program_details/1.json
  def destroy
    @pmu_race_program_detail.destroy

    respond_to do |format|
      format.html { redirect_to pmu_race_program_details_url, notice: "Pmu race program detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pmu_race_program_detail
      @pmu_race_program_detail = PmuRaceProgramDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pmu_race_program_detail_params
      params.require(:pmu_race_program_detail).permit(:uid, :pmu_race_program_id, :race_date, :race_start_time, :tpe_closure_time, :race_type, :description, :content)
    end
end
