module BlackbookApi
  class VehicleMake
    include Virtus.model

    attribute :name, String

    def self.from_blackbook_hash data={}
      new.tap do |make|
        make.name = data["name"]
      end
    end
  end
end
