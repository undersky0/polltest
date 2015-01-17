require 'rails_helper'

RSpec.describe "votings/index", :type => :view do
  before(:each) do
    assign(:votings, [
      Voting.create!(),
      Voting.create!()
    ])
  end

  it "renders a list of votings" do
    render
  end
end
