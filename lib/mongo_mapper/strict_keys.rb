require 'mongo_mapper'
require 'mongo_mapper/plugins'
require 'mongo_mapper/strict_keys/version'

module MongoMapper
  module Plugins
    module StrictKeys
      extend ActiveSupport::Concern

      module ClassMethods; end

      module InstanceMethods
        def ensure_key_exists(name)
          unless respond_to?("#{name}=")
            raise ArgumentError.new("Attribute '#{name}' has not been explicitly defined as a key.")
          end
        end
      end

    end
  end
end
