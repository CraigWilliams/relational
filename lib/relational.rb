require_relative "relational/version"
require_relative "relational/has_many_through"
require_relative 'relational/strategies/factory'
require_relative 'relational/strategies/base'
require_relative 'relational/strategies/join_table_strategy'
require_relative 'relational/strategies/both_values_strategy'
require_relative 'relational/strategies/through_strategy'


module Relational
  ActiveRecord::Base.send(:include, Relational::HasManyThrough)
end
