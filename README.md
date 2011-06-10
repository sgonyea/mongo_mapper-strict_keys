# MongoMapper: StrictKeys

## Usage:

### In your Gemfile:

        gem 'mongo_mapper-strict_keys', '~>0.0.4'

To force strict keys for all models, from the outset:

        gem 'mongo_mapper-strict_keys', '~>0.0.4', :require => 'mongo_mapper/strict_keys/force_plugin'

### In your Source Code / Model:

        require 'mongo_mapper/strict_keys'

        class StrictModel
          include MongoMapper::Document

          strict_keys!
        end
