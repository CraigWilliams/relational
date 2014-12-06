module Relational
  module HasManyThrough

    def self.included(base)
      base.class_eval do
        def self.has_many_through(*args)
          options = args.extract_options!
          hmt_options = { resource: self, resource_name: args.shift, join_table_name: args.shift, options: options }
          strategy = Relational::Strategies::Factory.for(hmt_options)
          strategy.apply
        end

        class << base
          alias_method :hmt, :has_many_through
        end
      end
    end

  end
end
