require 'cgi'
require 'open-uri'

module Tenpay
  module Service
    GATEWAY_URL = 'https://gw.tenpay.com/gateway/pay.htm'

    CREATE_INTERACTIVE_MODE_REQUIRED_OPTIONS = %w( body subject return_url notify_url partner out_trade_no total_fee fee_type spbill_create_ip sign )
    def self.create_interactive_mode_url(options)
      options = {
          'input_charset' => 'UTF-8',
          'partner' => Tenpay.pid,
          'fee_type' => '1'
      }.merge(Utils.stringify_keys(options))

      check_required_options(options, CREATE_INTERACTIVE_MODE_REQUIRED_OPTIONS)

      "#{GATEWAY_URL}?#{query_string(options)}"
    end

    private

    def self.query_string(options)
      options.merge('sign' => Tenpay::Sign.generate(options)).map do |key, value|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
      end.join('&')
    end

    def self.check_required_options(options, names)
      names.each do |name|
        warn("Tenpay Warn: missing required option: #{name}") unless options.has_key?(name)
      end
    end
  end
end
