require 'rails_helper'

RSpec.describe "user_directories/show", type: :view do
  before(:each) do
    @user_directory = assign(:user_directory, UserDirectory.create!(
      :user_id => 1,
      :name => "Name",
      :parent_id => 2,
      :cover => "Cover"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Cover/)
  end
end
