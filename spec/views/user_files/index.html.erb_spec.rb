require 'rails_helper'

RSpec.describe "user_files/index", type: :view do
  before(:each) do
    assign(:user_files, [
      UserFile.create!(
        :user_id => 1,
        :file_id => 2,
        :directory_id => 3,
        :full_name => "Full Name",
        :short_name => "Short Name",
        :cover => "Cover"
      ),
      UserFile.create!(
        :user_id => 1,
        :file_id => 2,
        :directory_id => 3,
        :full_name => "Full Name",
        :short_name => "Short Name",
        :cover => "Cover"
      )
    ])
  end

  it "renders a list of user_files" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
  end
end
