# encoding: utf-8
require 'guard'
require 'guard/guard'

module Guard
  class Evax < Guard

    autoload :Evax, 'evax'
    autoload :Notifier, 'guard/evax/notifier'

    def initialize(watchers = [], options = {})
      super

      self.options = {
        :run_at_start => false,
        :notify => true,
        :assets_file => "config/assets.yml",
        :after_block => lambda {}
      }.merge!(options)
    end

    def start
      run_evax if options[:run_at_start]
    end

    def stop
      true
    end

    def reload
      run_evax
    end

    def run_all
      run_evax
    end

    def run_on_change(paths)
      run_evax
    end

  private
    def notify?
      !!options[:notify]
    end

    def run_evax
      UI.info 'Running evax', :reset => true
      started_at = Time.now

      relative_path = Dir.pwd
      assets_path   = File.expand_path "#{relative_path}/#{options[:assets_file]}"

      Evax.new(assets_path, relative_path).build

      options[:after_block].call

      duration = (Time.now - started_at).to_f.round(4)

      Notifier::notify(duration) if notify?

      UI.info "Evax finished in #{duration} s", :reset => true
    end

  end
end
