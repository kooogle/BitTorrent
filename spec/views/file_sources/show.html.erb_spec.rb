require 'rails_helper'

RSpec.describe "file_sources/show", type: :view do
  before(:each) do
    @file_source = assign(:file_source, FileSource.create!(
      :file_name => "File Name",
      :file_type => "File Type",
      :file_size => "File Size",
      :file_md5 => "File Md5",
      :file_path => "File Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/File Type/)
    expect(rendered).to match(/File Size/)
    expect(rendered).to match(/File Md5/)
    expect(rendered).to match(/File Path/)
  end
end
