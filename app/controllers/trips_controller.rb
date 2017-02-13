class TripsController < ApplicationController
  require 'twilio-ruby'

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
      flash[:success] = "Trip Updated"
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

    respond_to do |format|
      format.js { render :js => "email_sent_clicked();" }
    end
  end

  def send_itineraty_sms
    trip = Trip.find(params[:id])
    number_to_send_to = trip.client_phone

    account_sid = "AC8b4751fdddf904ab0811f965be01c6e1"
    auth_token = "4b758008706f2551cb1ed2294dbe178d"
    twilio_phone_number = "15125807780"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
                                        from: "+1#{twilio_phone_number}",
                                        to: "+1#{number_to_send_to}",
                                        body: "It's Sherpa Time #{trip_url(trip)}",
                                    })
    respond_to do |format|
      format.js { render :js => "text_sent_clicked();" }
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:id, :first_name, :last_name, :trip_message, :sherpa_owner, :date_of_travel, :client_email, :client_phone)
  end



end
