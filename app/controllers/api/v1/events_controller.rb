class API::V1::EventsController < API::V1::BaseController
  def index

    events = Event.all

    events = events.map do |event|
      { 
        id: event.id,
        uid: event.uid,
        slug: event.slug,
        title: event.title,
        start_date: event.start_date,
        end_date: event.end_date,
        event_category: event.event_category,
        content: event.content,
        
        cover_url: cover_url(event),
        
      }
    end
    render json: {events: events, status: 200}
    #render json: { message: "Welcome to the app!" }
  end

  # Show
  def show
    event = Event.find_by(uid: params[:uid])
    event = {
      id: event.id,
      uid: event.uid,
      slug: event.slug,
      title: event.title,
      start_date: event.start_date,
      end_date: event.end_date,
      event_category: event.event_category,
      content: event.content,
        
      cover_url: cover_url(event),
    }
    render json: {event: event, status: 200}
    #puts "EVENT: #{event.inspect}"
  end

  def cover_url(event)
    rails_blob_url(event.cover) if event.cover.attachment
  end
end