module BlackbookApi
  module Configure

    def configure
      yield self if block_given?
    end

    def username
      @@username
    end

    def username=(username)
      @@username = username
    end

    def password
      @@password
    end

    def password=(password)
      @@password = password
    end

  end
end