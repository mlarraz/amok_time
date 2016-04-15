require "amok_time/mixins"
require "amok_time/version"

module AmokTime
  class << self
    attr_accesor :enabled

    def enable!
      self.enabled = true

      Date.singleton_class.prepend AmokTime::Mixins::Date
      Time.singleton_class.prepend AmokTime::Mixins::Time
      DateTime.singleton_class.prepend AmokTime::Mixins::DateTime
    end
  end
end
