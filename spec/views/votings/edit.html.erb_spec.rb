require 'rails_helper'

RSpec.describe "votings/edit", :type => :view do
  before(:each) do
    @voting = assign(:voting, Voting.create!())
  end

  it "renders the edit voting form" do
    render

    assert_select "form[action=?][method=?]", voting_path(@voting), "post" do
    end
  end
end
