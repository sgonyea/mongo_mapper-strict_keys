require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe 'MongoMapper::Plugins::StrictKeys -- Forced Plugin' do
  require 'mongo_mapper/strict_keys/force_plugin'

  class ForcedModel
    include MongoMapper::Document

    key :string_key, String
  end

  describe 'Instance attributes' do
    before(:each) do
      @fm = ForcedModel.new
    end

    context 'attributes-as-methods' do
      it 'should accept attributes-as-methods for pre-defined keys' do
        lambda {
          @fm.string_key = "I work!"
        }.should_not raise_error

        @fm.string_key.should == "I work!"
      end

      it 'should reject attributes-as-methods for never-defined keys' do
        lambda {
          @fm.not_defined = 'blowed up'
        }.should raise_error(NoMethodError)
      end
    end

    context 'attributes-in-brackets' do
      it 'should accept attributes-in-brackets for pre-defined keys' do
        lambda {
          @fm[:string_key] = "I work!"
        }.should_not raise_error

        @fm[:string_key].should == "I work!"
      end

      it 'should reject attributes-in-brackets for never-defined keys' do
        lambda {
          @fm[:not_defined] = 'blowed up'
        }.should raise_error(ArgumentError)
      end
    end

  end
end
