require 'mongo_mapper/strict_keys'

module MongoMapper
  module Plugins
    module StrictKeys
      module Bang
        extend ActiveSupport::Concern

        module ClassMethods
          # Includes the MongoMapper::Plugins::StrictKeys MongoMapper Plugin
          # @see MongoMapper::Plugins::StrictKeys
          def strict_keys!
            self.send(:include, ::MongoMapper::Plugins::StrictKeys)
          end
        end

        module InstanceMethods; end

      end
    end
  end
end
