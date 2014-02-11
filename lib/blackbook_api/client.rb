module BlackbookApi
  class Client
    include HTTParty
    base_uri 'https://service.blackbookcloud.com'
    default_params fmt: :json

    def decode_vin(vin, failure_handler = RequestFailureHandler)
      response = self.class.get "/UsedCarWS/UsedCarWS/UsedVehicle/VIN/#{vin}", headers:{ "Authorization" => auth_credentials }
      vehicles = []

      handle_failure response, failure_handler do
        used_vehicles = response.parsed_response["used_vehicles"]

        if used_vehicles.fetch("data_available") == true
          used_vehicles.fetch("used_vehicle_list").each do |data|
            vehicles << Vehicle.from_blackbook_hash(data)
          end
        end

      end

      vehicles
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

  end
end
