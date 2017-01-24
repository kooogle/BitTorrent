require 'rails_helper'

RSpec.describe "file_sources/new", type: :view do
  before(:each) do
    assign(:file_source, FileSource.new(
      :file_name => "MyString",
      :file_type => "MyString",
      :file_size => "MyString",
      :file_md5 => "MyString",
      :file_path => "MyString"
    ))
  end

  it "renders new file_source form" do
    render

    assert_select "form[action=?][method=?]", file_sources_path, "post" do

      assert_select "input#file_source_file_name[name=?]", "file_source[file_name]"

      assert_select "input#file_source_file_type[name=?]", "file_source[file_type]"

      assert_select "input#file_source_file_size[name=?]", "file_source[file_size]"

      assert_select "input#file_source_file_md5[name=?]", "file_source[file_md5]"

      assert_select "input#file_source_file_path[name=?]", "file_source[file_path]"
    end
  end
end
