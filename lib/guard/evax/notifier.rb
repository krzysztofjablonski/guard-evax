# encoding: utf-8
module Guard
  class Evax
    class Notifier
      def self.notify(duration)
        message = "Evax finished in #{duration} s"
        image   = :success

        ::Guard::Notifier.notify(message, :title => 'Evax', :image => image)
      end
    end
  end
end
