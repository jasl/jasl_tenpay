require 'digest/md5'

module JaslTenpay
  module Sign
    def self.generate(params)
      query = params.sort.map do |key, value|
        "#{key}=#{value}"
      end.join('&')

      Digest::MD5.hexdigest("#{query}&key=#{JaslTenpay.key}").upcase
    end

    def self.verify?(params)
      params = Utils.stringify_keys(params)
      sign = params.delete('sign')

      generate(params) == sign
    end
  end
end
