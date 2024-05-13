class EventsController < ApplicationController
  before_action :authenticate_account! , except: [:show]

  before_action :set_event, only: %i[ show edit update destroy ]
  layout "admin"

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    render layout: "front"
  end

  # GET /events/new
  def new
    @countries = Country.all
    @event_categories = EventCategory.all
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @countries = Country.all
    @event_categories = EventCategory.all
  end

  # POST /events or /events.json
  def create
    @event = current_account.events.build(event_params)

    respond_to do |format|
      if @event.save
        @events = Event.all
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @events = Event.all
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @event = Event.friendly.find(params[:event_id])
    end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :event_category_id, :start_date, :end_date, :start_time, :end_time, :content, :country_id, :city, :address, :phone, :email, :facebook_url, :twitter_url, :tiktok_url, :instagram_url, :linkedin_url, :snapchat_url, :cover)
    end
end
