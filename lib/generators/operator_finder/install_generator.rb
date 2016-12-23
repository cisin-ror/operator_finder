module OperatorFinder
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path("../../templates", __FILE__)
			desc 'Creates a OperatorFinder gem configuration file an initializer at config/initializers/operator_finder.rb'

			# def self.source_root
			# 	@_operator_finder_source_root ||= File.expand_path("../templates", __FILE__)
			# end

			# def create_config_file
				# template 'sugarcrm.yml', File.join('config', 'sugarcrm.yml')
			# end

			def create_initializer_file
				template 'operator_finder.rb', File.join('config', 'initializers', 'operator_finder.rb')
			end
		end
	end
end
