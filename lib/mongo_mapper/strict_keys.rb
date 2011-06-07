require 'mongo_mapper/strict_keys/version'

module MongoMapper
  module Plugin
    module StrictKeys
      extend ActiveSupport::Concern

      module ClassMethods; end

      module InstanceMethods
        def ensure_key_exists(name)
          # Do nothing.
          raise RuntimeError.new("OMG I should break your test but I don't!")
        end
      end

    end
  end
end
