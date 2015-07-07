module Refinery
  module Abouts
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Abouts

      engine_name :refinery_abouts

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "abouts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.abouts_admin_abouts_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Abouts)
      end
    end
  end
end
