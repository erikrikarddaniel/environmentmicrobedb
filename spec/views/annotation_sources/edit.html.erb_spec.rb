require 'spec_helper'

describe "annotation_sources/edit" do
  before(:each) do
    @annotation_source = assign(:annotation_source, stub_model(AnnotationSource,
      :bio_observation_id => 1,
      :dbname => "MyString",
      :dbversion => "MyString",
      :algorithm => "MyString",
      :algorithm_parameters => "MyString"
    ))
  end

  it "renders the edit annotation_source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => annotation_sources_path(@annotation_source), :method => "post" do
      assert_select "input#annotation_source_bio_observation_id", :name => "annotation_source[bio_observation_id]"
      assert_select "input#annotation_source_dbname", :name => "annotation_source[dbname]"
      assert_select "input#annotation_source_dbversion", :name => "annotation_source[dbversion]"
      assert_select "input#annotation_source_algorithm", :name => "annotation_source[algorithm]"
      assert_select "input#annotation_source_algorithm_parameters", :name => "annotation_source[algorithm_parameters]"
    end
  end
end
