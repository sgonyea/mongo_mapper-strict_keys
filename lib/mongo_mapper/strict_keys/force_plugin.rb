require 'mongo_mapper/strict_keys'

MongoMapper::Document.plugin(MongoMapper::Plugins::StrictKeys)
MongoMapper::EmbeddedDocument.plugin(MongoMapper::Plugins::StrictKeys)
