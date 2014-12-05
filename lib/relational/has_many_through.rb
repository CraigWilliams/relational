module Relational
  module HasManyThrough

    def self.included(base)
      base.class_eval do
        def self.has_many_through(resource_table = nil, join_table = nil)
          options = { resource: self, resource_name: resource_table, join_table_name: join_table }
          strategy = Relational::Strategies::Factory.for(options)
          strategy.apply
        end

        class << base
          alias_method :hmt, :has_many_through
        end
      end
    end

  end
end
