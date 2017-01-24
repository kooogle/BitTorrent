require 'rails_helper'

RSpec.describe "user_directories/edit", type: :view do
  before(:each) do
    @user_directory = assign(:user_directory, UserDirectory.create!(
      :user_id => 1,
      :name => "MyString",
      :parent_id => 1,
      :cover => "MyString"
    ))
  end

  it "renders the edit user_directory form" do
    render

    assert_select "form[action=?][method=?]", user_directory_path(@user_directory), "post" do

      assert_select "input#user_directory_user_id[name=?]", "user_directory[user_id]"

      assert_select "input#user_directory_name[name=?]", "user_directory[name]"

      assert_select "input#user_directory_parent_id[name=?]", "user_directory[parent_id]"

      assert_select "input#user_directory_cover[name=?]", "user_directory[cover]"
    end
  end
end
