module BlackbookApi
  class BlackbookApiErrorHandler < BlackbookApiError

    def self.call message, code, response, json_response
      raise BlackbookApiError.new(message, code, response, json_response)
    end
  end
end
