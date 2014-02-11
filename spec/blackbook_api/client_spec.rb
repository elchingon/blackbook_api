require 'spec_helper'

describe BlackbookApi::Client, "#decode_vin" do
  context "with a successful response" do
    let(:valid_vin){ "4T1BK1EB6DU056165" }

    it "returns an BlackbookApi::Vehicle", :vcr do
      result = default_client.decode_vin valid_vin
      expect(result).to be_an(BlackbookApi::Vehicle)
    end
  end

  context "with an unsuccessful response" do
    it "calls the default failure handler method with the raw response", :vcr do
      expect(BlackbookApi::RequestFailureHandler).to receive(:call)

      default_client.decode_vin "invalid_vin"
    end

    it "calls the provided failure handler method with the raw response", :vcr do
      failure_handler = double("failure_handler")

      expect(failure_handler).to receive(:call)

      default_client.decode_vin "invalid_vin", failure_handler
    end
  end
end

def default_client
  @_default_client ||= BlackbookApi::Client.new
end
