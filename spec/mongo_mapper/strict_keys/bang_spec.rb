require File.expand_path("../../spec_helper", File.dirname(__FILE__))

describe MongoMapper::Plugins::StrictKeys::Bang do
  class ForcedBySugar
    include MongoMapper::Document
    strict_keys!
  end

  context 'MongoMapper::Plugins::StrictKeys Mixin' do
    it 'should be present in the ancestors' do
      ForcedBySugar.ancestors.should include(MongoMapper::Plugins::StrictKeys::InstanceMethods)
    end
  end
end
