require 'spec_helper'

describe BlackbookApi::Client, "#decode_vin" do
  let(:valid_vin){ "4T1BK1EB6DU056165" }

  context "with a successful response" do
    it "returns an BlackbookApi::Vehicle", :vcr do
      result = default_client.decode_vin valid_vin
      expect(result[:vehicles].count).to be > 0
      expect(result[:vehicles].first).to be_an(BlackbookApi::Vehicle)
      expect(result[:status]).to eq('Success')
    end

    it "returns an BlackbookApi::Vehicle with long vin", :vcr do
      long_vin = "1ZVFT84N365245356J"
      result = default_client.decode_vin long_vin
      expect(result[:vehicles].count).to be > 0
      expect(result[:vehicles].first).to be_an(BlackbookApi::Vehicle)
      expect(result[:status]).to eq('Success')
    end
  end

  context "with an unsuccessful response" do
    it "returns error message when vin not found", :vcr do

      result = default_client.decode_vin "invalid_vin"
      expect(result[:vehicles].count).to eq(0)
      expect(result[:status]).to eq('Error')
      expect(result[:message]).to include('Error')

    end

    it "returns error message when vin too short", :vcr do

      result = default_client.decode_vin "invalid_vin"
      expect(result[:vehicles].count).to eq(0)
      expect(result[:status]).to eq('Error')
      expect(result[:message]).to include('Vin too short')

    end

    it "returns AuthenticationError if no username is passed" do
      BlackbookApi.username = nil
      expect do
        default_client.decode_vin valid_vin
      end.to raise_error BlackbookApi::AuthenticationError
    end
  end
end

describe BlackbookApi::Client, "#make_list_by_year" do
    let(:valid_year){ "2012" }

  context "with a successful response" do
    it "returns an BlackbookApi::VehicleMake", :vcr do
      result = default_client.make_list_by_year valid_year
      expect(result[:makes].count).to be > 0
      expect(result[:makes].first).to be_an(BlackbookApi::VehicleMake)
      expect(result[:status]).to eq('Success')
    end
  end

  context "with an unsuccessful response" do
    it "returns error message when invalid year passed", :vcr do

      result = default_client.make_list_by_year "invalid_year"

      expect(result[:makes].count).to eq(0)
      expect(result[:status]).to eq('Error')
      expect(result[:message]).to include('Error')
    end

    it "returns AuthenticationError if no username is passed" do
      BlackbookApi.username = nil
      expect do
        default_client.make_list_by_year valid_year
      end.to raise_error BlackbookApi::AuthenticationError
    end
  end
end

def default_client
  @_default_client ||= BlackbookApi::Client.new
end
