module JaslTenpay
  class Notify
    GATEWAY = 'https://gw.tenpay.com/gateway/simpleverifynotifyid.xml'
    SUCCESS_STR = '<retcode>0</retcode>'
    TRADE_STATE_SUCCESS_STR = '<trade_state>0</trade_state>'

    def self.verify?(params, options = {})
      return false unless Sign.verify?(params)

      params = {
          'input_charset' => 'UTF-8',
          'partner' => JaslTenpay.pid,
          'notify_id' => CGI.escape(params[:notify_id].to_s)
      }
      result = open("#{GATEWAY}?#{Utils.make_query_string(params)}").read

      result.include?(SUCCESS_STR) && (options[:verify_trade_state] ? result.include?(TRADE_STATE_SUCCESS_STR) : true)
    end
  end
end
