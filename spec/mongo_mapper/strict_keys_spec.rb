require File.expand_path("../spec_helper", File.dirname(__FILE__))

describe MongoMapper::Plugins::StrictKeys do

  class SimpleModel
    include MongoMapper::Document
    include MongoMapper::Plugins::StrictKeys

    key :string_key, String
  end

  describe 'Instance attributes' do
    before(:each) do
      @sm = SimpleModel.new
    end

    context 'attributes-as-methods' do
      it 'should accept attributes-as-methods for pre-defined keys' do
        lambda {
          @sm.string_key = "I work!"
        }.should_not raise_error

        @sm.string_key.should == "I work!"
      end

      it 'should reject attributes-as-methods for never-defined keys' do
        lambda {
          @sm.not_defined = 'blowed up'
        }.should raise_error(NoMethodError)
      end
    end

    context 'attributes-in-brackets' do
      it 'should accept attributes-in-brackets for pre-defined keys' do
        lambda {
          @sm[:string_key] = "I work!"
        }.should_not raise_error

        @sm[:string_key].should == "I work!"
      end

      it 'should reject attributes-in-brackets for never-defined keys' do
        lambda {
          @sm[:not_defined] = 'blowed up'
        }.should raise_error(ArgumentError)
      end
    end

  end
end
