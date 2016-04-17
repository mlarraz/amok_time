$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'amok_time'
require 'pry'

RSpec.configure do |config|
  config.disable_monkey_patching!
end
