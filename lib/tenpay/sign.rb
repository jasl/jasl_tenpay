require 'digest/md5'

module Tenpay
  module Sign
    def self.generate(params)
      query = params.sort.map do |key, value|
        "#{key}=#{value}"
      end.join('&')

      Digest::MD5.hexdigest("#{query}&key=#{Tenpay.key}").upcase
    end

    def self.verify?(params)
      params = Utils.stringify_keys(params)
      sign = params.delete('sign')

      generate(params) == sign
    end
  end
end
