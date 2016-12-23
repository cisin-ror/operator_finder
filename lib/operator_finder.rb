require "operator_finder/version"
require 'operator_finder/helpers/configuration'
require 'uri'
require 'net/http'
require 'byebug'
require 'yaml'
require 'json'
require "operator_finder/load"

module OperatorFinder
	extend Configuration
	
	attr_accessor :client_id, :uri
  
  define_setting :jolo_api_token, ""
  define_setting :jolo_user_id, ""
  
  def self.run_action(params = {})
   if OperatorFinder.jolo_api_token.nil? || OperatorFinder.jolo_api_token == "" || OperatorFinder.jolo_user_id.nil? || OperatorFinder.jolo_user_id.nil?
    final_result = "Please provide jolo api token in config/initializers/operator_finder.rb, Ex: config.jolo_api_token = \\'name\\'"
   elsif OperatorFinder.jolo_api_token.include? 'Please'
    final_result = "Please Update Operator Finder Configuration."
   else
  	@params = params.merge({
      userid: OperatorFinder.jolo_user_id,
  		key: OperatorFinder.jolo_api_token
  	})
  	OperatorFinder.execute
   end
  end

  def self.execute
    begin
      @uri.query = URI.encode_www_form(@params)
      @response = Net::HTTP.get_response(@uri)
      result = JSON.parse(@response.body)
      circle_code = ""
      operator = ""

      if CIRCLEOPERATOR["circle_code"].keys.include?(result["circle_code"].to_i)
        circle_code = CIRCLEOPERATOR["circle_code"][result["circle_code"].to_i]
      end

      if CIRCLEOPERATOR["operator"].keys.include?(result["operator_code"].to_i)
        operator = CIRCLEOPERATOR["operator"][result["operator_code"].to_i]
      end

      final_result = operator+" "+circle_code
      return final_result
      
    rescue
      {:error=>"Transaction Failed",:status=>false}
    rescue => err_msg
      {:error=>"#{err_msg}",:status=>false}
    end
  end

  def self.get_operator_detail(number)
  	@uri = URI("https://joloapi.com/api/findoperator.php?")
    if number.length != 10
      final_result = "Please pass 10 digits mobile number(ex: 8888888888)"
    else
      params = {
        mob: number,
        type: 'json'
      }
      OperatorFinder.run_action params
    end
  end
end
