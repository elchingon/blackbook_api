module BlackbookApi
  class AddDeductItem
    include Virtus.model

    attribute :uoc, Integer
    attribute :name, String
    attribute :xclean, Float
    attribute :clean, Float
    attribute :avg, Float
    attribute :rough, Float
    attribute :auto, String

    def self.from_blackbook_hash data={}
      new.tap do |item|
        item.uoc = data["uoc"]
        item.name = data["name"]
        item.xclean = data["xclean"]
        item.clean = data["clean"]
        item.avg = data["avg"]
        item.rough = data["rough"]
        item.auto = data["auto"]
      end
    end

  end
end
