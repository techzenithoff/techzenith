class SmtpServerSettingsController < ApplicationController
  before_action :authenticate_user!
    layout "dashboard"
    
  before_action :set_smtp_server_setting, only: [:show, :edit, :update, :destroy]

  # GET /smtp_server_settings
  # GET /smtp_server_settings.json
  def index
    @smtp_server_settings = SmtpServerSetting.all
  end

  # GET /smtp_server_settings/1
  # GET /smtp_server_settings/1.json
  def show
  end

  # GET /smtp_server_settings/new
  def new
    @smtp_server_setting = SmtpServerSetting.new
  end

  def smtp_settings
    @smtp_server_setting = SmtpServerSetting.take
  end

  # GET /smtp_server_settings/1/edit
  def edit
  end

  # POST /smtp_server_settings
  # POST /smtp_server_settings.json
  def create
    @smtp_server_setting = current_user.build_smtp_server_setting(smtp_server_setting_params)

    respond_to do |format|
      if @smtp_server_setting.save
        format.html { redirect_to configurations_path, notice: 'Smtp server setting was successfully created.' }
        format.json { render :show, status: :created, location: @smtp_server_setting }
        format.js
      else
        format.html { render :new }
        format.json { render json: @smtp_server_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /smtp_server_settings/1
  # PATCH/PUT /smtp_server_settings/1.json
  def update
    respond_to do |format|
      if @smtp_server_setting.update(smtp_server_setting_params)
        format.html { redirect_to configurations_path, notice: 'Smtp server setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @smtp_server_setting }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @smtp_server_setting.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /smtp_server_settings/1
  # DELETE /smtp_server_settings/1.json
  def destroy
    @smtp_server_setting.destroy
    respond_to do |format|
      format.html { redirect_to smtp_server_settings_url, notice: 'Smtp server setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smtp_server_setting
      @smtp_server_setting = SmtpServerSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smtp_server_setting_params
      params.require(:smtp_server_setting).permit(:user_name, :user_password,  :address, :domain, :port, :authentification, :enable_starttls_auto, :ssl)
    end
end
