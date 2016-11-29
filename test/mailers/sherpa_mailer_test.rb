require 'test_helper'

class SherpaMailerTest < ActionMailer::TestCase
  test "send_itinerary_link" do
    mail = SherpaMailer.send_itinerary_link
    assert_equal "Send itinerary link", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_itinerary" do
    mail = SherpaMailer.send_itinerary
    assert_equal "Send itinerary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
