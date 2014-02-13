require 'spec_helper'

describe BlackbookApi::Client, "#decode_vin" do
    let(:valid_vin){ "4T1BK1EB6DU056165" }

  context "with a successful response" do
    it "returns an BlackbookApi::Vehicle", :vcr do
      result = default_client.decode_vin valid_vin
      expect(result.count).to be > 0
      expect(result.first).to be_an(BlackbookApi::Vehicle)
    end
  end

  context "with an unsuccessful response" do
    it "calls the default failure handler method with the raw response", :vcr do

      expect(BlackbookApi::BlackbookApiErrorHandler).to receive(:call)

      default_client.decode_vin "invalid_vin"
    end

    it "returns AuthenticationError if no username is passed", :vcr do
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
      expect(result.count).to be > 0
      expect(result.first).to be_an(BlackbookApi::VehicleMake)
    end
  end

  context "with an unsuccessful response" do
    it "calls the default failure handler method with the raw response", :vcr do

      expect(BlackbookApi::BlackbookApiErrorHandler).to receive(:call)

      default_client.make_list_by_year "invalid_year"
    end

    it "returns AuthenticationError if no username is passed", :vcr do
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
