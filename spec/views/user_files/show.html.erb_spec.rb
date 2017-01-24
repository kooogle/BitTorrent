require 'rails_helper'

RSpec.describe "user_files/show", type: :view do
  before(:each) do
    @user_file = assign(:user_file, UserFile.create!(
      :user_id => 1,
      :file_id => 2,
      :directory_id => 3,
      :full_name => "Full Name",
      :short_name => "Short Name",
      :cover => "Cover"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Short Name/)
    expect(rendered).to match(/Cover/)
  end
end
