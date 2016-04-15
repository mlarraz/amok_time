module AmokTime
  module Mixins
    module Date
      def today
        if Thread.current[:amok_time].present?
          Thread.current[:amok_time].to_date
        else
          super
        end
      end

      def parse(*args)
        str = args.first

        if str && ::Date::DAYNAMES[str.capitalize]
          offset = ::Date::DAYNAMES.index(str.capitalize) - ::Date.today.wday

          ::Date.today + offset
        else
          super
        end
      end

      # TODO: Figure out if this is necessary
      # def strptime(str = '-4712-01-01', fmt = '%F', start = ::Date::ITALY)
      #   ::Time.strptime(str, fmt).to_date
      # end
    end

    module DateTime
      def now
        if Thread.current[:amok_time].present?
          Thread.current[:amok_time].to_datetime
        else
          super
        end
      end

      def parse(*args)
        str = args.first

        if str && ::Date::DAYNAMES[str.capitalize]
          offset = ::Date::DAYNAMES.index(str.capitalize) - ::DateTime.now.wday

          parsed_weekday = (::DateTime.now + offset)

          ::DateTime.new(parsed_weekday.year, parsed_weekday.month, parsed_weekday.day, 0, 0, 0, 0)
        else
          super
        end
      end
    end

    module Time
      def now
        if Thread.current[:amok_time].present?
          Thread.current[:amok_time].to_time
        else
          super
        end
      end

      def new(*args)
        if args.size <= 0
          ::Time.now
        else
          super
        end
      end
    end
  end
end