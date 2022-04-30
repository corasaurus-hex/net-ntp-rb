RSpec.describe Net::NTP do
  before(:all) do
    @result1 = Net::NTP.get
    sleep 0.1
    @result2 = Net::NTP.get
  end

  describe "get response" do
    it "has a leap indicator" do
      assert_includes Net::NTP::LEAP_INDICATOR.keys, @result1.leap_indicator
    end

    it "has a leap indicator as text" do
      assert_includes Net::NTP::LEAP_INDICATOR.values, @result1.leap_indicator_text
    end

    it "has a version number" do
      assert_equal 3, @result1.version_number
    end

    it "has a mode" do
      assert_includes Net::NTP::MODE.keys, @result1.mode
    end

    it "has a mode as text" do
      assert_includes Net::NTP::MODE.values, @result1.mode_text
    end

    it "has a stratum" do
      assert_includes Net::NTP::STRATUM.keys, @result1.stratum
    end

    it "has a stratum as text" do
      assert_includes Net::NTP::STRATUM.values, @result1.stratum_text
    end

    it "has a poll interval" do
      # Technically it can be -128 - 127 but a poll interval of negative numbers
      # only makes sense if you have a time machine.
      assert_includes (0..127), @result1.poll_interval
    end
  end
end
