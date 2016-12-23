APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
$: << File.join(APP_ROOT, 'lib')
require 'operator_finder'
require 'operator_finder/helpers/configuration'

RSpec.configure do |config|
  # some (optional) config here
end
