class UsersController < ApplicationController
  before_action :authenticate_account!
  before_action :set_user, only: %i[ show edit update destroy ]
  layout "dashboard"

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @roles = Role.where.not(name: ["Superuser"])
    @user = User.new
    @user.build_account
  end

  # GET /users/1/edit
  def edit
    
    @roles = Role.where.not(name: ["Superuser"])
    #@user.build_account
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @users = User.all
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
        format.js
      else

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if user_params[:account_attributes][:password].blank? #&& params[:user][:password_confirmation].blank?
      user_params[:account_attributes].delete(:password)
      user_params[:account_attributes].delete(:password_confirmation)
    end
    
    respond_to do |format|
      if @user.update(user_params)
        @users = User.all
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

   def delete
      @user = User.find_by(uid: params[:user_id])
    end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :civility,  account_attributes: [:id,  :email, :role_id, :password, :password_confirmation,  :_destroy])
    end
end
