require 'rails_helper'

RSpec.describe "file_sources/index", type: :view do
  before(:each) do
    assign(:file_sources, [
      FileSource.create!(
        :file_name => "File Name",
        :file_type => "File Type",
        :file_size => "File Size",
        :file_md5 => "File Md5",
        :file_path => "File Path"
      ),
      FileSource.create!(
        :file_name => "File Name",
        :file_type => "File Type",
        :file_size => "File Size",
        :file_md5 => "File Md5",
        :file_path => "File Path"
      )
    ])
  end

  it "renders a list of file_sources" do
    render
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "File Type".to_s, :count => 2
    assert_select "tr>td", :text => "File Size".to_s, :count => 2
    assert_select "tr>td", :text => "File Md5".to_s, :count => 2
    assert_select "tr>td", :text => "File Path".to_s, :count => 2
  end
end
