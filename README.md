# Amok Time

Utility for mocking time across service boundaries on a per-request basis.
Also passes the mock along to any background jobs enqueued during the request.

Amok Time is designed for end-to-end testing distributed systems where certain behavior is time-based.
It works by allowing any client to send a request header that overrides Ruby's date and time.

What could **possibly** go wrong?

<img src=https://i.imgur.com/ZqAy9co.jpg height="75%" width="75%" title="Safety not guaranteed"/>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amok_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amok_time

## Usage

```ruby
# In a Rails initializer or equivalent file
AmokTime.enable!
```

### Rails

```ruby
# In the same initializer as above
require 'amok_time/rack_middleware'

Rails.application.config.middleware.use AmokTime::RackMiddleware
```

### Sinatra

```ruby
require 'amok_time/rack_middleware'

class MyApp < Sinatra::Base
  use AmokTime::RackMiddleware
end
```

### Sidekiq

```ruby
# In your sidekiq initializer

require 'amok_time/sidekiq_middlware'

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add AmokTime::SidekiqMiddleware::Client
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add AmokTime::SidekiqMiddleware::Server
  end

  # Need this again for any downstream jobs enqueued
  config.client_middleware do |chain|
    chain.add AmokTime::SidekiqMiddleware::Client
  end
end
```

### API
For a given HTTP request to a service with Amok Time enabled, you can add the following header

```ruby
req.headers['X-Amok-Time'] = timestamp.to_s # any Date or Time object will work
```

The app will then behave as if the request was sent at that date.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/mlarraz/amok_time>.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

