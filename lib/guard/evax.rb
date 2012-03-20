# encoding: utf-8
require 'guard'
require 'guard/guard'

module Guard
  class Evax < Guard

    autoload :Evax, 'evax'

    def initialize(watchers = [], options = {})
      super

      options[:run_at_start] ||= true
      options[:assets_file] ||= "config/assets.yml"
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
      true
    end

    def run_on_change(paths)
      run_evax
    end

  private
    def run_evax
      UI.info 'Running evax', :reset => true
      started_at = Time.now

      relative_path = Dir.pwd
      assets_path   = File.expand_path "#{relative_path}/#{options[:assets_file]}"

      Evax.new(assets_path, relative_path).build

      widgets_js = File.read( File.expand_path( "#{relative_path}/public/assets/widgets.js" ) )
      File.open( File.expand_path( "#{relative_path}/public/assets/widgets.js" ), "w" ) { |f| f.write widgets_js }

      widgets_filepath    = File.expand_path "#{relative_path}/public/assets/widgets.js"
      widgets_filepath_v2 = File.expand_path "#{relative_path}/public/javascripts/widget/v2/widgets.js"
      FileUtils.mv(widgets_filepath, widgets_filepath_v2)

      UI.info "Evax finished in #{(Time.now - started_at).to_f} sec", :reset => true
    end

  end
end
