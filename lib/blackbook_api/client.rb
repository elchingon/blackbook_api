module BlackbookApi
  class Client
    include HTTParty
    base_uri 'https://service.blackbookcloud.com'
    default_params fmt: :json

    def decode_vin(vin, failure_handler = RequestFailureHandler)
      vehicles = []

      response = self.class.get "/UsedCarWS/UsedCarWS/UsedVehicle/VIN/#{vin}", :headers => { "Authorization" =>  "Basic " + auth_credentials }
       #query: { :username => BlackbookApi.username, :password => BlackbookApi.password }
      parsed_response = JSON.parse(response)

      handle_failure response, failure_handler do
        used_vehicles = parsed_response["used_vehicles"]

        if used_vehicles.fetch("data_available") == true
          used_vehicles.fetch("used_vehicle_list").each do |data|
            vehicles << Vehicle.from_blackbook_hash(data)
          end
          # TODO - handle warning_count
        elsif parsed_response['error_count'] > 0
          parsed_response['message_list'].each do |msg|
            if msg['type'] == "Error"
              BlackbookApiErrorHandler.call(msg['description'], response.code, response, parsed_response)
            end
          end
        end

      end

      vehicles
    end

    def make_list_by_year(year, failure_handler = RequestFailureHandler)
      makes = []
      response = self.class.get "/UsedCarWS/UsedCarWS/Drilldown/ALL/#{year}", :headers => { "Authorization" =>  "Basic " + auth_credentials }

      parsed_response = JSON.parse(response)
      drilldown = parsed_response["drilldown"]
      handle_failure response, failure_handler do
        make_list = drilldown["class_list"][0]["year_list"][0]["make_list"]

        if drilldown.fetch("data_available") == true
      binding.pry
          make_list.each do |make|
            makes << VehicleMake.from_blackbook_hash(make)
          end
          # TODO - handle warning_count
        elsif parsed_response['error_count'] > 0
          parsed_response['message_list'].each do |msg|
            if msg['type'] == "Error"
              BlackbookApiErrorHandler.call(msg['description'], response.code, response, parsed_response)
            end
          end
        end

      end

      makes
    end

    private

    def handle_failure response, failure_handler, &block
      if response.code == 200
        block.call
      else
        failure_handler.call response
      end
    end

    def auth_credentials
      unless BlackbookApi.username
        raise AuthenticationError.new('No username provided. ' +
                                      'Set your username in BlackbookApi initializer ' +
                                      'config.username = <BLACKBOOK_USERNAME>"')
      end
      unless BlackbookApi.password
        raise AuthenticationError.new('No password provided. ' +
                                      'Set your password in BlackbookApi initializer ' +
                                      'config.password = <BLACKBOOK_PASSWORD>"')
      end

      generate_base64(BlackbookApi.username + ":" + BlackbookApi.password)
    end

    def generate_base64 str
      Base64.encode64(str).chomp
    end
  end
end
