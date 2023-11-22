require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get date:date" do
    get bookings_date:date_url
    assert_response :success
  end
end
