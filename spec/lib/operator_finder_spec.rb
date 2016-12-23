require 'spec_helper'

describe OperatorFinder do

	it 'It should not have jolo api token' do
    expect(OperatorFinder.jolo_api_token).to eq("")
  end
  	
  it 'It should have jolo api token' do
    expect(OperatorFinder.jolo_api_token).not_to be_nil
  end

  it 'Check for api token configuration if not provided' do
  	config = OperatorFinder.run_action
  	expect(config).to eq("Please provide jolo api token in config/initializers/operator_finder.rb, Ex: config.jolo_api_token = \\'name\\'")
 	end

 	it 'Check for api token configuration if provided' do
 		OperatorFinder.jolo_api_token = "Please"
  	config = OperatorFinder.run_action
  	expect(config).to eq("Please Update Operator Finder Configuration.")
 	end
end
