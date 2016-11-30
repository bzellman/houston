class TripsController < ApplicationController

  before_action :require_login, only: [:new, :create, :index, :edit, :update]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:success] = "Trip Created"
      redirect_to @trip
    else
      render 'new'
    end
  end

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @tripitems = @trip.tripitems
    @tripitem = @trip.tripitems.build
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      # flash[:success] = "Trip Updated"
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def send_itinerary
    puts 'send'
    trip = Trip.find(params[:id])
    puts "This trip is for #{trip.client_email}"
    SherpaMailer.send_itinerary_link(trip).deliver_now
  end


  private

  def trip_params
    params.require(:trip).permit(:id, :first_name, :last_name, :trip_message, :sherpa_owner, :date_of_travel, :client_email, :client_phone)
  end

end
