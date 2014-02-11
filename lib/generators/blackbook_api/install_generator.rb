require 'rails/generators/base'

module BlackbookApi
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)


      desc "This generator creates a blackbook_api initializer file at config/initializers"

      def copy_initializer_file
        template "initializer.rb", "config/initializers/blackbook_api.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
