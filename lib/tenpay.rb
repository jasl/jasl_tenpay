require 'tenpay/utils'
require 'tenpay/sign'
require 'tenpay/service'
require 'tenpay/notify'

module Tenpay
  class<< self
    attr_accessor :pid, :key
  end
end
