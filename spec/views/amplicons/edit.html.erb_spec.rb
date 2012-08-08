require 'spec_helper'

describe "amplicons/edit" do
  before(:each) do
    @amplicon = assign(:amplicon, stub_model(Amplicon,
      :sample_id => 1,
      :n_specific => 1,
      :n_unspecific => ""
    ))
  end

  it "renders the edit amplicon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => amplicons_path(@amplicon), :method => "post" do
      assert_select "input#amplicon_sample_id", :name => "amplicon[sample_id]"
      assert_select "input#amplicon_n_specific", :name => "amplicon[n_specific]"
      assert_select "input#amplicon_n_unspecific", :name => "amplicon[n_unspecific]"
    end
  end
end
