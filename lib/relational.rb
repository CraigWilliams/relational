require_relative "relational/version"

module Relational
  autoload :Base, 'relational/strategies/base'
  autoload :JoinTableStrategy, 'relational/strategies/join_table_strategy'

  ActiveRecord::Base.send(:include, Relational::HasManyThrough)
end
