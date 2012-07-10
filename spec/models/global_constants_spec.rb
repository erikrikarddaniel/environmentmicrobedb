require 'spec_helper'

describe GlobalConstants do
  describe "#convertions" do
    describe "#can convert" do
      it "string to string" do
        GlobalConstants::convert("string","test_string").should == "test_string"
      end
      it "integer to integer" do
        GlobalConstants::convert("integer","156").should == 156
      end
      it "datetime to datetime" do
        GlobalConstants::convert("datetime","24.08.1984 12:34:56 +0200").should == "Fri, 24 Aug 1984 12:34:56 +0200".to_datetime
      end
      it "date to date" do
        GlobalConstants::convert("date","24.08.1984 12:34:56 +0200").should == "Fri, 24 Aug 1984 12:34:56 +0200".to_datetime.to_date
      end
      it "time to time" do
        GlobalConstants::convert("time","24.08.1984 12:34:56 +0200").should == "Fri, 24 Aug 1984 12:34:56 +0200".to_datetime.to_time
      end
      it "bool ('true') to bool ('true')" do
        GlobalConstants::convert("bool","true").should == true
      end
      it "bool ('false') to bool ('false')" do
        GlobalConstants::convert("bool","false").should == false
      end
      it "bool ('yes') to bool ('true')" do
        GlobalConstants::convert("bool","yes").should == true
      end
      it "bool ('no') to bool ('false')" do
        GlobalConstants::convert("bool","no").should == false
      end
      it "bool ('1') to bool ('true')" do
        GlobalConstants::convert("bool","1").should == true
      end
      it "bool ('0') to bool ('false')" do
        GlobalConstants::convert("bool","0").should == false
      end
      it "float to float" do
        GlobalConstants::convert("float","10.123").should == 10.123
      end
    end
    describe "#Can NOT convert string to" do
      it "integer" do
        GlobalConstants::convert("integer","test_string").should == :error
      end
      it "datetime" do
        GlobalConstants::convert("datetime","test_string").should == :error
      end
      it "date" do
        GlobalConstants::convert("date","test_string").should == :error
      end
      it "time" do
        GlobalConstants::convert("time","test_string").should == :error
      end
      it "bool" do
        GlobalConstants::convert("bool","test_string").should == :error
      end
      it "float" do
        GlobalConstants::convert("float","test_string").should == :error
      end
    end
  end
end