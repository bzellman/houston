# Preview all emails at http://localhost:3000/rails/mailers/sherpa_mailer
class SherpaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sherpa_mailer/send_itinerary_link
  def send_itinerary_link
    trip = Trip.first
    SherpaMailer.send_itinerary_link(trip)
  end

  # Preview this email at http://localhost:3000/rails/mailers/sherpa_mailer/send_itinerary
  def send_itinerary
    SherpaMailer.send_itinerary
  end

end
