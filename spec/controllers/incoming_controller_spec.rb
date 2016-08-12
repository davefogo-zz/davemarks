require 'rails_helper'

RSpec.describe IncomingController, type: :controller do
  describe "#clean_up" do
    it "cleans up the hyphens" do
      string = "-- string"
      expect(clean_up(string)).to eq("string")
    end
  end
end
