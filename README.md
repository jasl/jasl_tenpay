# JaslTenpay

A simple Tenpay ruby gem, without unnecessary magic or wraper, it's directly facing how Tenpay api works.
copied from [alipay](https://github.com/chloerei/alipay) .

It contain this API:

* Generate payment url
* Verify notify

Please read Tenpay official document first: <http://help.tenpay.com/mch/> .

## Demo

see <https://github.com/jasl/tenpay_demo> .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jasl_tenpay'
```

or development version

```ruby
gem 'jasl_tenpay', :github => 'jasl/tenpay'
```

And then execute:

```sh
$ bundle
```

## Usage

### Config

```ruby
JaslTenpay.pid = 'YOUR_PID'
JaslTenpay.key = 'YOUR_KEY'
```

### Generate payment url

```ruby
options = {
  :out_trade_no      => 'YOUR_ORDER_ID',         # 20130801000001
  :subject           => 'YOUR_ORDER_SUBJECCT',   # Fitbit flex
  :body              => 'YOUR_ORDER_DESCRIPTION',# from knewone.com
  :total_fee         => 1,                       # price, unit: cent
  :spbill_create_ip  => request.ip               # user ip
  :return_url        => 'YOUR_ORDER_RETURN_URL', # http://knewone.com/orders/1/tenpay_callback
  :notify_url        => 'YOUR_ORDER_NOTIFY_URL'  # http://knewone.com/orders/1/tenpay_notify
}

JaslTenpay::Service.create_interactive_mode_url(options)
# => 'https://gw.tenpay.com/gateway/pay.htm?...'
```

You can redirect user to this payment url, and user will see a payment page for his/her order.

read [Tenpay sdk doc](http://help.tenpay.com/mch/>) to get more options' details.

### Verify notify

```ruby
# example in rails
# The notify url MUST be set when generate payment url
# IMPORTANT: Notify may reach earlier than callback
def tenpay_notify
  if JaslTenpay::Notify.verify? params.except(*request.path_parameters.keys)
    # TODO: valid notify, code your business logic here.
    render text: 'success'
  else
    render text: 'fail'
  end
end
```

## Contributing

Bug report or pull request are welcome.

### Make a pull request

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please write unit test with your code if necessary.

## License

This project rocks and uses MIT-LICENSE.
