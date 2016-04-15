module AmokTime
  class RackMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if AmokTime.enabled
        Thread.current[:amok_time] = headers['X-Amok-Time']
      end

      [status, headers, response]
    end
  end
end
