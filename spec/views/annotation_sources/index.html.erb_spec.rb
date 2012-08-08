require 'spec_helper'

describe "annotation_sources/index" do
  before(:each) do
    assign(:annotation_sources, [
      stub_model(AnnotationSource,
        :bio_observation_id => 1,
        :dbname => "Dbname",
        :dbversion => "Dbversion",
        :algorithm => "Algorithm",
        :algorithm_parameters => "Algorithm Parameters"
      ),
      stub_model(AnnotationSource,
        :bio_observation_id => 1,
        :dbname => "Dbname",
        :dbversion => "Dbversion",
        :algorithm => "Algorithm",
        :algorithm_parameters => "Algorithm Parameters"
      )
    ])
  end

  it "renders a list of annotation_sources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dbname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dbversion".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Algorithm".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Algorithm Parameters".to_s, :count => 2
  end
end
