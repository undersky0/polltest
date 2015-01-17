require 'rails_helper'

RSpec.describe "votings/show", :type => :view do
  before(:each) do
    @voting = assign(:voting, Voting.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
