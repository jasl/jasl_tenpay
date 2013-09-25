module Tenpay
  class Notify
    GATEWAY = 'https://gw.tenpay.com/gateway/simpleverifynotifyid.xml'
    SUCCESS_STR = '<retcode>0</retcode>'

    def self.verify?(params)
      if Sign.verify?(params)
        params = {
            'input_charset' => 'UTF-8',
            'partner' => Tenpay.pid,
            'notify_id' => CGI.escape(params[:notify_id].to_s)
        }

        open("#{GATEWAY}?#{Utils.make_query_string(params)}").read.include? SUCCESS_STR
      else
        false
      end
    end
  end
end
