class PermissionsController < ApplicationController
  authorize_resource
  
  before_action :authenticate_account!
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  layout "dashboard"
  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @features = Feature.all 
    @roles = Role.where.not(name: ["superuser", "root"])
    @permissions = Permission.all
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
    @features = Feature.all 
    @roles = Role.where.not(name: ["superuser", "root"])
    @permissions = Permission.all
    permissions = @permission.permission_items

    @selected_permissions = permissions unless permissions.blank?

  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

     # Create Scholarship study levels
     params[:permission_items][:permission_actions].each do |permission_action|
      unless permission_action.empty?
        @permission.permission_items.build(action_name: permission_action)
      end
    end

    respond_to do |format|
      if @permission.save
        @permissions = Permission.all
        format.html { redirect_to @permission, notice: 'permission was successfully created.' }
        format.json { render :show, status: :created, location: @permission }
        format.js
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    @permission.permission_items.delete_all
     # Create Scholarship study levels
     params[:permissions][:id].each do |permission|
      unless permission.empty?
        @permission.permission_items.build(permission_id: permission)
      end
    end

    respond_to do |format|
      if @permission.update(permission_params)
        @permissions = permission.all
        format.html { redirect_to @permission, notice: 'permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_params
      params.require(:permission).permit(:role_id, :feature_id, permission_items_attributes: [:permission_actions])
    end
end
