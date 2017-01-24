require 'rails_helper'

RSpec.describe "user_directories/index", type: :view do
  before(:each) do
    assign(:user_directories, [
      UserDirectory.create!(
        :user_id => 1,
        :name => "Name",
        :parent_id => 2,
        :cover => "Cover"
      ),
      UserDirectory.create!(
        :user_id => 1,
        :name => "Name",
        :parent_id => 2,
        :cover => "Cover"
      )
    ])
  end

  it "renders a list of user_directories" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
  end
end
