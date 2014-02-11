module BlackbookApi
  class Vehicle
    include Virtus.model

    attribute :state, String
    attribute :vin, String # Positions 1-8 and 10 will be returned here
    attribute :uvc, String # Black Book Universal Vehicle Code
    attribute :groupnum, Integer # => If 7000 or greater the vehicle is classified as a truck
    attribute :make, String
    attribute :model, String
    attribute :year, Integer
    attribute :style, String
    attribute :series, String # can be empty if no series exists
    attribute :mileage_cat, String
    attribute :class_code, String
    attribute :class_name, String
    attribute :mpg_city, Integer
    attribute :mpg_highway, Integer
    attribute :engine_cylinders, Integer
    attribute :engine_description, String
    attribute :engine_displacement, String
    attribute :engine_fuel_type, String
    attribute :transmission, String # A = automatic, M = manual, can be null
    attribute :drivetrain, String
    attribute :num_gears, Integer
    attribute :price_base_whole_xclean, BigDecimal
    attribute :price_mileage_whole_xclean, Float
    attribute :price_add_deduct_whole_xclean, Float
    attribute :price_regional_whole_xclean, Float
    attribute :price_adjusted_whole_xclean, BigDecimal
    attribute :price_base_whole_clean, BigDecimal
    attribute :price_mileage_whole_clean, Float
    attribute :price_add_deduct_whole_clean, Float
    attribute :price_regional_whole_clean, Float
    attribute :price_adjusted_whole_clean, BigDecimal
    attribute :price_base_whole_avg, BigDecimal
    attribute :price_mileage_whole_avg, Float
    attribute :price_add_deduct_whole_avg, Float
    attribute :price_regional_whole_avg, Float
    attribute :price_adjusted_whole_avg, BigDecimal
    attribute :price_base_whole_rough, BigDecimal
    attribute :price_mileage_whole_rough, Float
    attribute :price_add_deduct_whole_rough, Float
    attribute :price_regional_whole_rough, Float
    attribute :price_adjusted_whole_rough, BigDecimal
    attribute :price_base_retail_xclean, BigDecimal
    attribute :price_mileage_retail_xclean, Float
    attribute :price_add_deduct_retail_xclean, Float
    attribute :price_regional_retail_xclean, Float
    attribute :price_adjusted_retail_xclean, BigDecimal
    attribute :price_base_retail_clean, BigDecimal
    attribute :price_mileage_retail_clean, Float
    attribute :price_add_deduct_retail_clean, Float
    attribute :price_regional_retail_clean, Float
    attribute :price_adjusted_retail_clean, BigDecimal
    attribute :price_base_retail_avg, BigDecimal
    attribute :price_mileage_retail_avg, Float
    attribute :price_add_deduct_retail_avg, Float
    attribute :price_regional_retail_avg, Float
    attribute :price_adjusted_retail_avg, BigDecimal
    attribute :price_base_retail_rough, BigDecimal
    attribute :price_mileage_retail_rough, Float
    attribute :price_add_deduct_retail_rough, Float
    attribute :price_regional_retail_rough, Float
    attribute :price_adjusted_retail_rough, BigDecimal
    attribute :price_base_tradein_xclean, BigDecimal
    attribute :price_mileage_tradein_xclean, Float
    attribute :price_add_deduct_tradein_xclean, Float
    attribute :price_regional_tradein_xclean, Float
    attribute :price_adjusted_tradein_xclean, BigDecimal
    attribute :price_base_tradein_clean, BigDecimal
    attribute :price_mileage_tradein_clean, Float
    attribute :price_add_deduct_tradein_clean, Float
    attribute :price_regional_tradein_clean, Float
    attribute :price_adjusted_tradein_clean, BigDecimal
    attribute :price_base_tradein_avg, BigDecimal
    attribute :price_mileage_tradein_avg, Float
    attribute :price_add_deduct_tradein_avg, Float
    attribute :price_regional_tradein_avg, Float
    attribute :price_adjusted_tradein_avg, BigDecimal
    attribute :price_base_tradein_rough, BigDecimal
    attribute :price_mileage_tradein_rough, Float
    attribute :price_add_deduct_tradein_rough, Float
    attribute :price_regional_tradein_rough, Float
    attribute :price_adjusted_tradein_rough, BigDecimal


    def self.from_blackbook_hash data={}
      new.tap do |vehicle|
        vehicle.state = data["state"]
        vehicle.vin = data["vin"]
        vehicle.uvc = data["uvc"]
        vehicle.groupnum = data["groupnum"]
        vehicle.make = data["make"]
        vehicle.model = data["model"]
        vehicle.year = data["model_year"]
        vehicle.style = data["style"]
        vehicle.series = data["series"]
        vehicle.mileage_cat = data["mileage_cat"]
        vehicle.class_code = data["class_code"]
        vehicle.class_name = data["class_name"]
        vehicle.mpg_city = data["city_mpg"]
        vehicle.mpg_highway = data["hwy_mpg"]
        vehicle.engine_cylinders = data["cylinders"]
        vehicle.engine_description = data["engine_description"]
        vehicle.engine_displacement = data["engine_displacement"]
        vehicle.engine_fuel_type = data["fuel_type"]
        vehicle.transmission = data["transmission"]
        vehicle.drivetrain = data["drivetrain"]
        vehicle.num_gears = data["num_gears"]
        vehicle.price_base_whole_xclean = data["price_base_whole_xclean"]
        vehicle.price_mileage_whole_xclean = data["price_mileage_whole_xclean"]
        vehicle.price_add_deduct_whole_xclean = data["price_add_deduct_whole_xclean"]
        vehicle.price_regional_whole_xclean = data["price_regional_whole_xclean"]
        vehicle.price_adjusted_whole_xclean = data["price_adjusted_whole_xclean"]
        vehicle.price_base_whole_clean = data["price_base_whole_clean"]
        vehicle.price_mileage_whole_clean = data["price_mileage_whole_clean"]
        vehicle.price_add_deduct_whole_clean = data["price_add_deduct_whole_clean"]
        vehicle.price_regional_whole_clean = data["price_regional_whole_clean"]
        vehicle.price_adjusted_whole_clean = data["price_adjusted_whole_clean"]
        vehicle.price_base_whole_avg = data["price_base_whole_avg"]
        vehicle.price_mileage_whole_avg = data["price_mileage_whole_avg"]
        vehicle.price_add_deduct_whole_avg = data["price_add_deduct_whole_avg"]
        vehicle.price_regional_whole_avg = data["price_regional_whole_avg"]
        vehicle.price_adjusted_whole_avg = data["price_adjusted_whole_avg"]
        vehicle.price_base_whole_rough = data["price_base_whole_rough"]
        vehicle.price_mileage_whole_rough = data["price_mileage_whole_rough"]
        vehicle.price_add_deduct_whole_rough = data["price_add_deduct_whole_rough"]
        vehicle.price_regional_whole_rough = data["price_regional_whole_rough"]
        vehicle.price_adjusted_whole_rough = data["price_adjusted_whole_rough"]

        vehicle.price_base_retail_xclean = data["price_base_retail_xclean"]
        vehicle.price_mileage_retail_xclean = data["price_mileage_retail_xclean"]
        vehicle.price_add_deduct_retail_xclean = data["price_add_deduct_retail_xclean"]
        vehicle.price_regional_retail_xclean = data["price_regional_retail_xclean"]
        vehicle.price_adjusted_retail_xclean = data["price_adjusted_retail_xclean"]
        vehicle.price_base_retail_clean = data["price_base_retail_clean"]
        vehicle.price_mileage_retail_clean = data["price_mileage_retail_clean"]
        vehicle.price_add_deduct_retail_clean = data["price_add_deduct_retail_clean"]
        vehicle.price_regional_retail_clean = data["price_regional_retail_clean"]
        vehicle.price_adjusted_retail_clean = data["price_adjusted_retail_clean"]
        vehicle.price_base_retail_avg = data["price_base_retail_avg"]
        vehicle.price_mileage_retail_avg = data["price_mileage_retail_avg"]
        vehicle.price_add_deduct_retail_avg = data["price_add_deduct_retail_avg"]
        vehicle.price_regional_retail_avg = data["price_regional_retail_avg"]
        vehicle.price_adjusted_retail_avg = data["price_adjusted_retail_avg"]
        vehicle.price_base_retail_rough = data["price_base_retail_rough"]
        vehicle.price_mileage_retail_rough = data["price_mileage_retail_rough"]
        vehicle.price_add_deduct_retail_rough = data["price_add_deduct_retail_rough"]
        vehicle.price_regional_retail_rough = data["price_regional_retail_rough"]
        vehicle.price_adjusted_retail_rough = data["price_adjusted_retail_rough"]

        vehicle.price_base_tradein_xclean = data["price_base_tradein_xclean"]
        vehicle.price_mileage_tradein_xclean = data["price_mileage_tradein_xclean"]
        vehicle.price_add_deduct_tradein_xclean = data["price_add_deduct_tradein_xclean"]
        vehicle.price_regional_tradein_xclean = data["price_regional_tradein_xclean"]
        vehicle.price_adjusted_tradein_xclean = data["price_adjusted_tradein_xclean"]
        vehicle.price_base_tradein_clean = data["price_base_tradein_clean"]
        vehicle.price_mileage_tradein_clean = data["price_mileage_tradein_clean"]
        vehicle.price_add_deduct_tradein_clean = data["price_add_deduct_tradein_clean"]
        vehicle.price_regional_tradein_clean = data["price_regional_tradein_clean"]
        vehicle.price_adjusted_tradein_clean = data["price_adjusted_tradein_clean"]
        vehicle.price_base_tradein_avg = data["price_base_tradein_avg"]
        vehicle.price_mileage_tradein_avg = data["price_mileage_tradein_avg"]
        vehicle.price_add_deduct_tradein_avg = data["price_add_deduct_tradein_avg"]
        vehicle.price_regional_tradein_avg = data["price_regional_tradein_avg"]
        vehicle.price_adjusted_tradein_avg = data["price_adjusted_tradein_avg"]
        vehicle.price_base_tradein_rough = data["price_base_tradein_rough"]
        vehicle.price_mileage_tradein_rough = data["price_mileage_tradein_rough"]
        vehicle.price_add_deduct_tradein_rough = data["price_add_deduct_tradein_rough"]
        vehicle.price_regional_tradein_rough = data["price_regional_tradein_rough"]
        vehicle.price_adjusted_tradein_rough = data["price_adjusted_tradein_rough"]
      end
    end
  end
end
