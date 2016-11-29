class SherpaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sherpa_mailer.send_itinerary_link.subject
  #
  def send_itinerary_link(trip)
    @trip = trip
    @greeting = "Hi"
    mail to: @trip.client_email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sherpa_mailer.send_itinerary.subject
  #
  def send_itinerary
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
