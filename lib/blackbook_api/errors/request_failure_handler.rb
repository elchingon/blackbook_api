module BlackbookApi
  class RequestFailureHandler < BlackbookApiError

    def self.call response
      raise RequestFailedError.new("API request returned a status code: #{response.code}",
                                    response.code, response)
    end
  end
end
