require 'test_helper'

class Tenpay::SignTest < Test::Unit::TestCase
  def setup
    @params = {
      :service => 'test',
      :partner => '123'
    }
    @sign = Digest::MD5.hexdigest("partner=123&service=test&key=#{Tenpay.key}")
  end

  def test_generate_sign
    assert_equal @sign, Tenpay::Sign.generate(@params)
  end
end
