module BlackbookApi
  module Generators
    class BlackbookApiGenerator < Rails::Generators::NamedBase
      Rails::Generators::ResourceHelpers

      source_root File.expand_path('../templates', __FILE__)

      namespace :blackbook_api

      desc "This generator creates an initializer file at config/initializers"

      def copy_initializer_file
        template "initializer.rb", "config/initializers/blackbook_api.rb"
      end

      def show_readme
        readme "README"
      end
    end
  end
end