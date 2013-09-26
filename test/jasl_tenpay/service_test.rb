require 'test_helper'

class JaslTenpay::ServiceTest < Test::Unit::TestCase
  def test_generate_create_interactive_mode_url
    options = {
        :body => 'test good',
        :subject => 'test',
        :return_url => 'http://tenpay.dev/tenpay_return',
        :notify_url => 'http://tenpay.dev/tenpay_notify',
        :out_trade_no => '1',
        :total_fee => 1,
        :spbill_create_ip => '127.0.0.1',
    }
    assert_not_nil JaslTenpay::Service.create_interactive_mode_url(options)
  end
end
