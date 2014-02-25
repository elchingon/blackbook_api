module BlackbookApi
  class MileageItem
    include Virtus.model

    attribute :model_year, Integer
    attribute :range_begin, Integer
    attribute :range_end, Integer
    attribute :xclean, Float
    attribute :clean, Float
    attribute :avg, Float
    attribute :rough, Float
    attribute :finadv, Float
    attribute :mileage_cat, String

    def self.from_blackbook_hash data={}
      new.tap do |item|
        item.model_year = data["model_year"]
        item.range_begin = data["range_begin"]
        item.range_end = data["range_end"]
        item.xclean = data["xclean"]
        item.clean = data["clean"]
        item.avg = data["avg"]
        item.rough = data["rough"]
        item.finadv = data["finadv"]
        item.mileage_cat = data["mileage_cat"]
      end
    end

  end
end
