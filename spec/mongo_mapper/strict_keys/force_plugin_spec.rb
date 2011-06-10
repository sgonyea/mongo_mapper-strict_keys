require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe 'MongoMapper::Plugins::StrictKeys -- Forced Plugin' do
  require 'mongo_mapper/strict_keys/force_plugin'

  class ForcedModel
    include MongoMapper::Document
  end

  context 'MongoMapper::Plugins::StrictKeys Mixin' do
    it 'should be present in the ancestors' do
      ForcedModel.ancestors.should include(MongoMapper::Plugins::StrictKeys::InstanceMethods)
    end
  end

end
