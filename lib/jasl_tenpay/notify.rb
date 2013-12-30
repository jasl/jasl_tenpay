module JaslTenpay
  module Notify
    GATEWAY = 'https://gw.tenpay.com/gateway/simpleverifynotifyid.xml'
    SUCCESS_STR = '<retcode>0</retcode>'
    TRADE_STATE_SUCCESS_STR = '<trade_state>0</trade_state>'

    def self.verify?(params)
      result = fetch_trade_result(params)

      result && result.include?(SUCCESS_STR)
    end

    def self.verify_trade_success?(params)
      result = fetch_trade_result(params)

      result && result.include?(SUCCESS_STR) && result.include?(TRADE_STATE_SUCCESS_STR)
    end

    private

    def self.fetch_trade_result(params)
      return nil unless Sign.verify?(params)

      params = {
          'input_charset' => 'UTF-8',
          'partner' => JaslTenpay.pid,
          'notify_id' => CGI.escape(params[:notify_id].to_s)
      }
      open("#{GATEWAY}?#{Utils.make_query_string(params)}").read
    end
  end
end
