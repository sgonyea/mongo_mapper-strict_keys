# MongoMapper: StrictKeys

## Usage:

### In your Gemfile:

        gem 'mongo_mapper-strict_keys', '~>0.0.5'

To force strict keys for all models, from the outset:

        gem 'mongo_mapper-strict_keys', '~>0.0.5', :require => 'mongo_mapper/strict_keys/force_plugin'

### In your Source Code / Model:

        require 'mongo_mapper/strict_keys'

        class StrictModel
          include MongoMapper::Document

          strict_keys!
        end

If you already required the force\_plugin, then you don't need to specify 'strict_keys!'
