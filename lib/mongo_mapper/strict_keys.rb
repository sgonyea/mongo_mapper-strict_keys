require 'mongo_mapper'
require 'mongo_mapper/plugins'
require 'mongo_mapper/strict_keys/version'
require 'mongo_mapper/strict_keys/bang'

module MongoMapper
  module Plugins
    module StrictKeys
      extend ActiveSupport::Concern

      module ClassMethods; end

      module InstanceMethods
        # @param [Symbol, String] name The name of the key to be ensured
        # @return [true] This method either returns true or raises an exception
        # @raise [ArgumentError] If 'name' has not been specified as a key
        # @see MongoMapper::Plugins::Keys#key
        def ensure_key_exists(name)
          unless respond_to?("#{name}=")
            raise ArgumentError.new("Attribute '#{name}' has not been explicitly defined as a key.")
          end
          true
        end
      end

    end
  end
end

MongoMapper::Document.plugin(MongoMapper::Plugins::StrictKeys::Bang)
MongoMapper::EmbeddedDocument.plugin(MongoMapper::Plugins::StrictKeys::Bang)
