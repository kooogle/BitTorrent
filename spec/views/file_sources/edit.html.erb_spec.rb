require 'rails_helper'

RSpec.describe "file_sources/edit", type: :view do
  before(:each) do
    @file_source = assign(:file_source, FileSource.create!(
      :file_name => "MyString",
      :file_type => "MyString",
      :file_size => "MyString",
      :file_md5 => "MyString",
      :file_path => "MyString"
    ))
  end

  it "renders the edit file_source form" do
    render

    assert_select "form[action=?][method=?]", file_source_path(@file_source), "post" do

      assert_select "input#file_source_file_name[name=?]", "file_source[file_name]"

      assert_select "input#file_source_file_type[name=?]", "file_source[file_type]"

      assert_select "input#file_source_file_size[name=?]", "file_source[file_size]"

      assert_select "input#file_source_file_md5[name=?]", "file_source[file_md5]"

      assert_select "input#file_source_file_path[name=?]", "file_source[file_path]"
    end
  end
end
