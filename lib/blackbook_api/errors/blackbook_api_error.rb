module BlackbookApi
  class BlackbookApiError < StandardError
    attr_reader :message
    attr_reader :http_status
    attr_reader :http_body
    attr_reader :json_body

    def initialize(message=nil, http_status=nil, http_body=nil, json_body=nil)
      super(message)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @json_body = json_body
    end

  end
end
