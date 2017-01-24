require 'rails_helper'

RSpec.describe "user_directories/new", type: :view do
  before(:each) do
    assign(:user_directory, UserDirectory.new(
      :user_id => 1,
      :name => "MyString",
      :parent_id => 1,
      :cover => "MyString"
    ))
  end

  it "renders new user_directory form" do
    render

    assert_select "form[action=?][method=?]", user_directories_path, "post" do

      assert_select "input#user_directory_user_id[name=?]", "user_directory[user_id]"

      assert_select "input#user_directory_name[name=?]", "user_directory[name]"

      assert_select "input#user_directory_parent_id[name=?]", "user_directory[parent_id]"

      assert_select "input#user_directory_cover[name=?]", "user_directory[cover]"
    end
  end
end
