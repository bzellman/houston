class TripitemsController < ApplicationController

  def create
    @tripitem = Tripitem.new(trip_item_params)
    if @tripitem.save
      flash[:success] = "You did it Brad"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = "The Trip Item Was Not Created"
    end
  end

  def edit
    @tripitem = Tripitem.find(params[:id])
  end

  def update
    @tripitem = Tripitem.find(params[:id])
    if @tripitem.update_attributes(trip_item_params)
      flash[:success] = "Trip Item Updated"
      @trip = Trip.find(@tripitem.trip_id)
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy

  end


  private

  def trip_item_params
    params.require(:tripitem).permit(:id, :activity_name, :location_name, :location_url, :activity_time, :activity_address, :activity_address_url, :sherpa_tip, :reservation, :trip_id)
  end
end
