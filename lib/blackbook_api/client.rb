module BlackbookApi
  class Client
    include HTTParty
    base_uri 'https://service.blackbookcloud.com'
    default_params fmt: :json

    def decode_vin(vin, failure_handler = RequestFailureHandler)
      vehicles = []
      message, status = '', ''

      vin = parse_vin vin #Only need first eight and 10th digit

      if vin
        response = self.class.get "/UsedCarWS/UsedCarWS/UsedVehicle/VIN/#{vin}", :headers => { "Authorization" =>  "Basic " + auth_credentials }
        parsed_response = JSON.parse(response)

        handle_failure response, failure_handler do
          used_vehicles = parsed_response["used_vehicles"]

          if used_vehicles.fetch("data_available") == true

            vehicles, message, status = handle_vehicle_list_response used_vehicles.fetch("used_vehicle_list")

            # TODO - handle warning_count
          elsif parsed_response['error_count'] > 0

            message, status = handle_message_list_response parsed_response['message_list']

          end
        end
      else
        message, status = "Error - Vin too short. Vin must be at least 10 digits.", "Error"
      end

      vehicles_response_hash vehicles, message, status
    end

    def make_list_by_year(year, failure_handler = RequestFailureHandler)
      makes = []
      message, status = '', ''

      response = self.class.get "/UsedCarWS/UsedCarWS/Drilldown/ALL/#{year}", :headers => { "Authorization" =>  "Basic " + auth_credentials }

      parsed_response = JSON.parse(response)
      drilldown = parsed_response["drilldown"]

      handle_failure response, failure_handler do

        if drilldown.fetch("data_available") == true

          make_list = drilldown["class_list"][0]["year_list"][0]["make_list"]
          makes, message, status = handle_make_list_response make_list

          # TODO - handle warning_count
        elsif parsed_response['error_count'] > 0

          message, status = handle_message_list_response parsed_response['message_list']

        end
      end

      makes_response_hash makes, message, status
    end

    def vehicles_response_hash vehicles, message, status
      { vehicles: vehicles, message: message, status: status }
    end

    def makes_response_hash makes, message, status
      { makes: makes, message: message, status: status }
    end


    private

    def parse_vin vin
      vin[0,8] + vin[9] if vin.length >= 10
    end

    def handle_vehicle_list_response vehicle_list
      vehicles = []

      vehicle_list.each do |data|
        vehicles << Vehicle.from_blackbook_hash(data)
      end

      [ vehicles, "#{vehicles.count} vehicles found.", "Success" ]
    end

    def handle_make_list_response make_list
      makes = []

      make_list.each do |make|
        makes << VehicleMake.from_blackbook_hash(make)
      end

      [ makes, "#{makes.count} makes found.", "Success" ]
    end

    def handle_message_list_response message_list
      message, status, error = "", "Success", false
      message_list.each do |msg|
        message << msg['type'] + " - " + msg['description']
        error = true if msg["type"] == "Error"
      end

      status = "Error" if error
      [ message, status ]
    end

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
