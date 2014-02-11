module BlackbookApi
  class BlackbookApiErrorHandler

    def self.call message, code, response, json_response
      raise BlackbookApi::BlackbookApiError.new(message, code, response, json_response)
    end
  end
end
