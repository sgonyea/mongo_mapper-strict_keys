require File.expand_path("../spec_helper", File.dirname(__FILE__))

describe MongoMapper::Plugin::StrictKeys do

  class SimpleModel
    include MongoMapper::Document
    include MongoMapper::Plugin::StrictKeys

    key :string_key, String
  end

  context 'Instance attributes' do
    before(:each) do
      @sm = SimpleModel.new
    end

    it 'should only accept attributes-as-methods for existing keys' do
      lambda {
        @sm.not_defined = 'blowed up'
      }.should raise_error(NoMethodError)
    end

    it 'should only accept attributes-in-brackets for existing keys' do
      @sm[:not_defined] = 'blowed up'
      @sm.save

      @other = SimpleModel.find(@sm.id)
      @other[:not_defined].should_not be_present
    end
  end
end
