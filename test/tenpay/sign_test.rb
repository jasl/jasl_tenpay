require 'test_helper'

class Tenpay::SignTest < Test::Unit::TestCase
  def setup
    @params = {
      :service => 'test',
      :partner => '123'
    }
    @sign = Digest::MD5.hexdigest("partner=123&service=test&key=#{Tenpay.key}").upcase
  end

  def test_generate_sign
    assert_equal @sign, Tenpay::Sign.generate(@params)
  end

  def test_verify_sign
    assert Tenpay::Sign.verify?(@params.merge(:sign => @sign))
  end

  def test_verify_sign_when_fails
    assert !Tenpay::Sign.verify?(@params.merge(:danger => 'danger', :sign => @sign))
  end
end
