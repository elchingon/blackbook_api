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
    attribute :wheel_base, Integer
    attribute :tire_size, String
    attribute :weight, Integer # gvw
    attribute :payload_cap, Integer
    attribute :tow_cap, Integer
    attribute :seat_cap, Integer
    attribute :seats, String
    attribute :fuel_cap, Float
    attribute :fuel_delivery, String
    attribute :aux_fuel_cap, Float
    attribute :base_hp, String
    attribute :taxable_hp, Integer
    attribute :torque, String
    attribute :ext_doors, String
    attribute :moon_sunroof, String
    attribute :entertain, String
    attribute :navigation, String
    attribute :airbags, String
    attribute :anti_corrosion_warranty, String
    attribute :basic_warranty, String
    attribute :powertrain_warranty, String
    attribute :bumper_to_bumper_warranty, String
    attribute :hybrid_warranty, String
    attribute :road_assist_warranty, String
    attribute :price_base_private_clean, BigDecimal
    attribute :price_mileage_private_clean, Float
    attribute :price_add_deduct_private_clean, Float
    attribute :price_regional_private_clean, Float
    attribute :price_adjusted_private_clean, BigDecimal
    attribute :price_base_private_avg, BigDecimal
    attribute :price_mileage_private_avg, Float
    attribute :price_add_deduct_private_avg, Float
    attribute :price_regional_private_avg, Float
    attribute :price_adjusted_private_avg, BigDecimal
    attribute :price_base_private_rough, BigDecimal
    attribute :price_mileage_private_rough, Float
    attribute :price_add_deduct_private_rough, Float
    attribute :price_regional_private_rough, Float
    attribute :price_adjusted_private_rough, BigDecimal
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
    attribute :region2, Float
    attribute :region3, Float
    attribute :region4, Float
    attribute :region5, Float
    attribute :region6, Float
    attribute :msrp, BigDecimal
    attribute :retail_equipped, BigDecimal
    attribute :price_includes, String

    attribute :add_deduct_list, Set[AddDeductItem]
    attribute :mileage_list, Set[MileageItem]

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
        vehicle.wheel_base = data["wheel_base"]
        vehicle.tire_size = data["tire_size"]
        vehicle.weight = data["gvw"]
        vehicle.payload_cap = (!data["payload_cap"].nil? ? data["payload_cap"].gsub(",","") :"")
        vehicle.tow_cap = (!data["tow_cap"].nil? ? data["tow_cap"].gsub(",","") : "")
        vehicle.seat_cap = data["seat_cap"]
        vehicle.seats = data["seats"]
        vehicle.fuel_cap = data["fuel_cap"]
        vehicle.fuel_delivery = data["fuel_delivery"]
        vehicle.aux_fuel_cap = data["aux_fuel_cap"]
        vehicle.base_hp = data["base_hp"]
        vehicle.taxable_hp = data["taxable_hp"]
        vehicle.torque = data["torque"]
        vehicle.ext_doors = data["ext_doors"]
        vehicle.moon_sunroof = data["moon_sunroof"]
        vehicle.entertain = data["entertain"]
        vehicle.navigation = data["navigation"]
        vehicle.airbags = data["airbags"]
        vehicle.anti_corrosion_warranty = data["anti_corrosion_warranty"]
        vehicle.basic_warranty = data["basic_warranty"]
        vehicle.powertrain_warranty = data["powertrain_warranty"]
        vehicle.bumper_to_bumper_warranty = data["bumper_to_bumper_warranty"]
        vehicle.hybrid_warranty = data["hybrid_warranty"]
        vehicle.road_assist_warranty = data["road_assist_warranty"]
        vehicle.price_base_private_clean = data["base_private_clean"]
        vehicle.price_mileage_private_clean = data["mileage_private_clean"]
        vehicle.price_add_deduct_private_clean = data["add_deduct_private_clean"]
        vehicle.price_regional_private_clean = data["regional_private_clean"]
        vehicle.price_adjusted_private_clean = data["adjusted_private_clean"]
        vehicle.price_base_private_avg = data["base_private_avg"]
        vehicle.price_mileage_private_avg = data["mileage_private_avg"]
        vehicle.price_add_deduct_private_avg = data["add_deduct_private_avg"]
        vehicle.price_regional_private_avg = data["regional_private_avg"]
        vehicle.price_adjusted_private_avg = data["adjusted_private_avg"]
        vehicle.price_base_private_rough = data["base_private_rough"]
        vehicle.price_mileage_private_rough = data["mileage_private_rough"]
        vehicle.price_add_deduct_private_rough = data["add_deduct_private_rough"]
        vehicle.price_regional_private_rough = data["regional_private_rough"]
        vehicle.price_adjusted_private_rough = data["adjusted_private_rough"]

        vehicle.price_base_retail_xclean = data["base_retail_xclean"]
        vehicle.price_mileage_retail_xclean = data["mileage_retail_xclean"]
        vehicle.price_add_deduct_retail_xclean = data["add_deduct_retail_xclean"]
        vehicle.price_regional_retail_xclean = data["regional_retail_xclean"]
        vehicle.price_adjusted_retail_xclean = data["adjusted_retail_xclean"]
        vehicle.price_base_retail_clean = data["base_retail_clean"]
        vehicle.price_mileage_retail_clean = data["mileage_retail_clean"]
        vehicle.price_add_deduct_retail_clean = data["add_deduct_retail_clean"]
        vehicle.price_regional_retail_clean = data["regional_retail_clean"]
        vehicle.price_adjusted_retail_clean = data["adjusted_retail_clean"]
        vehicle.price_base_retail_avg = data["base_retail_avg"]
        vehicle.price_mileage_retail_avg = data["mileage_retail_avg"]
        vehicle.price_add_deduct_retail_avg = data["add_deduct_retail_avg"]
        vehicle.price_regional_retail_avg = data["regional_retail_avg"]
        vehicle.price_adjusted_retail_avg = data["adjusted_retail_avg"]
        vehicle.price_base_retail_rough = data["base_retail_rough"]
        vehicle.price_mileage_retail_rough = data["mileage_retail_rough"]
        vehicle.price_add_deduct_retail_rough = data["add_deduct_retail_rough"]
        vehicle.price_regional_retail_rough = data["regional_retail_rough"]
        vehicle.price_adjusted_retail_rough = data["adjusted_retail_rough"]

        vehicle.price_base_tradein_clean = data["base_tradein_clean"]
        vehicle.price_mileage_tradein_clean = data["mileage_tradein_clean"]
        vehicle.price_add_deduct_tradein_clean = data["add_deduct_tradein_clean"]
        vehicle.price_regional_tradein_clean = data["regional_tradein_clean"]
        vehicle.price_adjusted_tradein_clean = data["adjusted_tradein_clean"]
        vehicle.price_base_tradein_avg = data["base_tradein_avg"]
        vehicle.price_mileage_tradein_avg = data["mileage_tradein_avg"]
        vehicle.price_add_deduct_tradein_avg = data["add_deduct_tradein_avg"]
        vehicle.price_regional_tradein_avg = data["regional_tradein_avg"]
        vehicle.price_adjusted_tradein_avg = data["adjusted_tradein_avg"]
        vehicle.price_base_tradein_rough = data["base_tradein_rough"]
        vehicle.price_mileage_tradein_rough = data["mileage_tradein_rough"]
        vehicle.price_add_deduct_tradein_rough = data["add_deduct_tradein_rough"]
        vehicle.price_regional_tradein_rough = data["regional_tradein_rough"]
        vehicle.price_adjusted_tradein_rough = data["adjusted_tradein_rough"]

        vehicle.region2 = data["region2"]
        vehicle.region3 = data["region3"]
        vehicle.region4 = data["region4"]
        vehicle.region5 = data["region5"]
        vehicle.msrp = data["msrp"]
        vehicle.retail_equipped = data["retail_equipped"]
        vehicle.price_includes = data["price_includes"]

        vehicle.add_deduct_list = data["add_deduct_list"]
        vehicle.mileage_list = data["mileage_list"]
      end
    end
  end
end
