require 'rails_helper'
require 'spec_helper'
RSpec.describe Voting, :type => :model do
  
    it {should validate_presence_of(:parliamentary)}
    it {should validate_presence_of(:party)}
    it {should validate_presence_of(:vote)}
  
    it "returns locations ward" do
    location = FactoryGirl.build(:voting, postcode: "CF11 6LL")
    @postcode = location.postcode.delete(' ')
    response = HTTParty.get("http://api.postcodes.io/postcodes/#{@postcode}").parsed_response    
    location.parliamentary = response["result"]["parliamentary_constituency"]
    expect(response["status"]).to eq 200
  end
end
