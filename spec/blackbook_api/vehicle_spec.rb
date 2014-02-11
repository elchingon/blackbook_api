require "spec_helper"

describe BlackbookApi::Vehicle, ".from_blackbook_hash" do
  context "with complete response" do
    let(:used_vehicles) { sample_response }

    let(:vehicle) {described_class.from_blackbook_hash used_vehicles.fetch("used_vehicles").fetch("used_vehicle_list").fetch(0)}

    it{ expect(vehicle.state).to eq("NT") }
    it{ expect(vehicle.make).to eq("Dodge") }
    it{ expect(vehicle.model).to eq("Grand Caravan") }
    it{ expect(vehicle.year).to eq(2012) }
    it{ expect(vehicle.vin).to eq("2C4RDGBGC") }
    it{ expect(vehicle.uvc).to eq("2012240049") }
    it{ expect(vehicle.style).to eq("Wagon") }
    it{ expect(vehicle.transmission).to eq("A") }
    it{ expect(vehicle.mpg_city).to eq(17) }
    it{ expect(vehicle.mpg_highway).to eq(25) }
    it{ expect(vehicle.engine_cylinders).to eq(6) }
    it{ expect(vehicle.engine_fuel_type).to eq("Flex") }

  end

  context "missing engine data" do
    let(:vehicle) {described_class.from_blackbook_hash {}}

    # All fields should be nil. Just don't want to write tests for them
    it{ expect(vehicle.make).to be_nil }
    it{ expect(vehicle.engine_cylinders).to be_nil }
    it{ expect(vehicle.engine_fuel_type).to be_nil }
  end

  def sample_response
    {
      "warning_count" => 0,
      "error_count" => 0,
      "message_list" => [],
      "token" => "D40A0152-F754-4360-B85F-6C9635FE0321",
      "token_expiration_minutes" => 60,
      "used_vehicles" => {
        "used_vehicle_list" => [
          {
            "publish_date" => "2/7/2014",
            "data_freq" => "D",
            "state" => "NT",
            "country" => "US",
            "vin" => "2C4RDGBGC",
            "uvc" => "2012240049",
            "groupnum" => "7165",
            "model_year" => "2012",
            "make" => "Dodge",
            "model" => "Grand Caravan",
            "series" => "SE",
            "style" => "Wagon",
            "mileage_cat" => "B",
            "class_code" => "S",
            "class_name" => "Passenger Van",
            "first_values_flag" => false,
            "risk_score" => "",
            "base_whole_xclean" => 0,
            "mileage_whole_xclean" => 0,
            "add_deduct_whole_xclean" => 0,
            "regional_whole_xclean" => 0,
            "adjusted_whole_xclean" => 0,
            "base_whole_clean" => 0,
            "mileage_whole_clean" => 0,
            "add_deduct_whole_clean" => 0,
            "regional_whole_clean" => 0,
            "adjusted_whole_clean" => 0,
            "base_whole_avg" => 0,
            "mileage_whole_avg" => 0,
            "add_deduct_whole_avg" => 0,
            "regional_whole_avg" => 0,
            "adjusted_whole_avg" => 0,
            "base_whole_rough" => 0,
            "mileage_whole_rough" => 0,
            "add_deduct_whole_rough" => 0,
            "regional_whole_rough" => 0,
            "adjusted_whole_rough" => 0,
            "base_retail_xclean" => 20075,
            "mileage_retail_xclean" => 0,
            "add_deduct_retail_xclean" => 0,
            "regional_retail_xclean" => 0,
            "adjusted_retail_xclean" => 20075,
            "base_retail_clean" => 18450,
            "mileage_retail_clean" => 0,
            "add_deduct_retail_clean" => 0,
            "regional_retail_clean" => 0,
            "adjusted_retail_clean" => 18450,
            "base_retail_avg" => 15675,
            "mileage_retail_avg" => 0,
            "add_deduct_retail_avg" => 0,
            "regional_retail_avg" => 0,
            "adjusted_retail_avg" => 15675,
            "base_retail_rough" => 13000,
            "mileage_retail_rough" => 0,
            "add_deduct_retail_rough" => 0,
            "regional_retail_rough" => 0,
            "adjusted_retail_rough" => 13000,
            "base_tradein_clean" => 15795,
            "mileage_tradein_clean" => 0,
            "add_deduct_tradein_clean" => 0,
            "regional_tradein_clean" => 0,
            "adjusted_tradein_clean" => 15795,
            "base_tradein_avg" => 13675,
            "mileage_tradein_avg" => 0,
            "add_deduct_tradein_avg" => 0,
            "regional_tradein_avg" => 0,
            "adjusted_tradein_avg" => 13675,
            "base_tradein_rough" => 10225,
            "mileage_tradein_rough" => 0,
            "add_deduct_tradein_rough" => 0,
            "regional_tradein_rough" => 0,
            "adjusted_tradein_rough" => 10225,
            "base_finadv" => 0,
            "mileage_finadv" => 0,
            "add_deduct_finadv" => 0,
            "regional_finadv" => 0,
            "adjusted_finadv" => 0,
            "base_resid12" => 0,
            "mileage_resid12" => 0,
            "add_deduct_resid12" => 0,
            "adjusted_resid12" => 0,
            "base_resid24" => 0,
            "mileage_resid24" => 0,
            "add_deduct_resid24" => 0,
            "adjusted_resid24" => 0,
            "base_resid30" => 0,
            "mileage_resid30" => 0,
            "add_deduct_resid30" => 0,
            "adjusted_resid30" => 0,
            "base_resid36" => 0,
            "mileage_resid36" => 0,
            "add_deduct_resid36" => 0,
            "adjusted_resid36" => 0,
            "base_resid42" => 0,
            "mileage_resid42" => 0,
            "add_deduct_resid42" => 0,
            "adjusted_resid42" => 0,
            "base_resid48" => 0,
            "mileage_resid48" => 0,
            "add_deduct_resid48" => 0,
            "adjusted_resid48" => 0,
            "base_resid60" => 0,
            "mileage_resid60" => 0,
            "add_deduct_resid60" => 0,
            "adjusted_resid60" => 0,
            "base_resid72" => 0,
            "mileage_resid72" => 0,
            "add_deduct_resid72" => 0,
            "adjusted_resid72" => 0,
            "region2" => -100,
            "region3" => 100,
            "region4" => -200,
            "region5" => -100,
            "region6" => -175,
            "msrp" => 20995,
            "retail_equipped" => 22925,
            "price_includes" => "AT AC 6CY",
            "wheel_base" => 121,
            "tire_size" => "235/60R16",
            "gvw" => 6050,
            "payload_cap" => "",
            "tow_cap" => "3,600",
            "seat_cap" => "7",
            "seats" => "Buckets, low-back; Manual",
            "fuel_type" => "Flex",
            "fuel_cap" => "20.0",
            "fuel_delivery" => "SMPI",
            "hwy_mpg" => "25",
            "city_mpg" => "17",
            "engine_description" => "3.6L V6 MPI DOHC VVT Flex",
            "cylinders" => "6",
            "engine_displacement" => "3.6L",
            "base_hp" => "283 @ 6300",
            "taxable_hp" => 34,
            "torque" => "260 @ 4300",
            "transmission" => "A",
            "drivetrain" => "FWD",
            "num_gears" => "6",
            "ext_doors" => "Sliding, side; Sliding, dual",
            "airbags" => "Side Curtain",
            "anti_corrosion_warranty" => "",
            "basic_warranty" => "3-year/36,000-mile, Limited",
            "powertrain_warranty" => "5-year/100,000-mile, Limited",
            "add_deduct_list" => [
              {
                "uoc" => "08",
                "name" => "Power Driver Seat",
                "xclean" => 300,
                "clean" => 300,
                "avg" => 300,
                "rough" => 300,
                "auto" => "N",
                "resid12" => 275,
                "resid24" => 250,
                "resid30" => 225,
                "resid36" => 225,
                "resid42" => 200,
                "resid48" => 200,
                "resid60" => 175,
                "resid72" => 150
              },
              {
                "uoc" => "N5",
                "name" => "Navigation System",
                "xclean" => 750,
                "clean" => 750,
                "avg" => 750,
                "rough" => 750,
                "auto" => "N",
                "resid12" => 600,
                "resid24" => 450,
                "resid30" => 375,
                "resid36" => 300,
                "resid42" => 225,
                "resid48" => 150,
                "resid60" => 0,
                "resid72" => 0
              },
              {
                "uoc" => "20",
                "name" => "Leather",
                "xclean" => 1025,
                "clean" => 1025,
                "avg" => 1025,
                "rough" => 1025,
                "auto" => "N",
                "resid12" => 950,
                "resid24" => 875,
                "resid30" => 825,
                "resid36" => 800,
                "resid42" => 750,
                "resid48" => 725,
                "resid60" => 650,
                "resid72" => 575
              },
              {
                "uoc" => "1S",
                "name" => "5 Passenger",
                "xclean" => -700,
                "clean" => -700,
                "avg" => -700,
                "rough" => -700,
                "auto" => "N",
                "resid12" => -600,
                "resid24" => -500,
                "resid30" => -450,
                "resid36" => -400,
                "resid42" => -350,
                "resid48" => -300,
                "resid60" => -200,
                "resid72" => -100
              }
            ],
            "mileage_list" => [
              {
                "model_year" => "2012",
                "range_begin" => 1,
                "range_end" => 9000,
                "xclean" => 250,
                "clean" => 375,
                "avg" => 550,
                "rough" => 0,
                "finadv" => 300,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 9001,
                "range_end" => 12000,
                "xclean" => 150,
                "clean" => 250,
                "avg" => 375,
                "rough" => 0,
                "finadv" => 200,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 12001,
                "range_end" => 18000,
                "xclean" => 0,
                "clean" => 150,
                "avg" => 250,
                "rough" => 0,
                "finadv" => 75,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 18001,
                "range_end" => 24000,
                "xclean" => -575,
                "clean" => 0,
                "avg" => 150,
                "rough" => 0,
                "finadv" => -325,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 24001,
                "range_end" => 30000,
                "xclean" => -1150,
                "clean" => -600,
                "avg" => 0,
                "rough" => 0,
                "finadv" => -900,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 30001,
                "range_end" => 40000,
                "xclean" => -1700,
                "clean" => -1175,
                "avg" => -575,
                "rough" => 0,
                "finadv" => -1450,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 40001,
                "range_end" => 50000,
                "xclean" => -2250,
                "clean" => -1725,
                "avg" => -1125,
                "rough" => -575,
                "finadv" => -1975,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 50001,
                "range_end" => 60000,
                "xclean" => -2800,
                "clean" => -2300,
                "avg" => -1700,
                "rough" => -1200,
                "finadv" => -2525,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 60001,
                "range_end" => 70000,
                "clean" => -2875,
                "avg" => -2300,
                "rough" => -1775,
                "finadv" => -3100,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 70001,
                "range_end" => 80000,
                "avg" => -2775,
                "rough" => -2250,
                "finadv" => -3700,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 80001,
                "range_end" => 90000,
                "avg" => -3425,
                "rough" => -2775,
                "finadv" => -4275,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 90001,
                "range_end" => 100000,
                "avg" => -4075,
                "rough" => -3475,
                "finadv" => -4850,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 100001,
                "range_end" => 115000,
                "avg" => -4875,
                "rough" => -4250,
                "finadv" => -5575,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 115001,
                "range_end" => 130000,
                "avg" => -5525,
                "rough" => -4775,
                "finadv" => -6425,
                "mileage_cat" => "B"
              },
              {
                "model_year" => "2012",
                "range_begin" => 130001,
                "range_end" => 999999,
                "avg" => -6475,
                "rough" => -5850,
                "finadv" => -7275,
                "mileage_cat" => "B"
              }
            ],
            "model_number_list" => [
              "RTKH53"
            ]
          }
        ],
        "template" => 1,
        "version" => 1,
        "data_included" => true,
        "data_available" => true
      }
    }
    end
end
