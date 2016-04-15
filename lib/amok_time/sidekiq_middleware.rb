module AmokTime
  module SidekiqMiddleware
    # Get the mocked time and store it in the message
    # to be sent to Sidekiq.
    class Client
      def call(worker_class, msg, queue, redis_pool)
        msg['amok_time'] ||= Thread.current[:amok_time]
        yield
      end
    end

    # Pull the mocked time out and set the current thread to use it.
    class Server
      def call(worker, msg, queue)
        Thread.current[:amok_time] = msg['amok_time']
        yield
      end
    end
  end
end
