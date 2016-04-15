module AmokTime
  module RailsFilter
    def self.before(controller)
      if AmokTime.enabled
        Thread.current[:amok_time] = controller.request.headers['X-Amok-Time']
      end
    end
  end
end
