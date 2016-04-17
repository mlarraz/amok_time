$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'coveralls'
Coveralls.wear!

require 'amok_time'

RSpec.configure do |config|
  config.disable_monkey_patching!
end
