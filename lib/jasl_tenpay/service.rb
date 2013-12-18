require 'cgi'
require 'open-uri'

module JaslTenpay
  module Service
    GATEWAY_URL = 'https://gw.tenpay.com/gateway/pay.htm'

    CREATE_INTERACTIVE_MODE_REQUIRED_OPTIONS = %w(body return_url notify_url partner out_trade_no total_fee fee_type spbill_create_ip)
    def self.create_interactive_mode_url(options)
      options = {
          'input_charset' => 'UTF-8',
          'partner' => JaslTenpay.pid,
          'fee_type' => '1'
      }.merge(Utils.stringify_keys(options))

      check_required_options(options, CREATE_INTERACTIVE_MODE_REQUIRED_OPTIONS)

      "#{GATEWAY_URL}?#{Utils.make_query_string(options)}"
    end

    private

    def self.check_required_options(options, names)
      names.each do |name|
        warn("Tenpay Warn: missing required option: #{name}") unless options.has_key?(name)
      end
    end
  end
end
