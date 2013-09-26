require 'jasl_tenpay/utils'
require 'jasl_tenpay/sign'
require 'jasl_tenpay/service'
require 'jasl_tenpay/notify'

module JaslTenpay
  class<< self
    attr_accessor :pid, :key
  end
end
