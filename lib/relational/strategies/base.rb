module Relational
  module Strategies
    class Base
      attr_reader :resource, :resource_name, :join_table_name, :options

      def initialize(options = {})
        @resource        = options.fetch(:resource)
        @resource_name   = options.fetch(:resource_name)
        @join_table_name = options.fetch(:join_table_name)
        @options         = options.fetch(:options)
      end

      def apply
        resource.has_many has_many_join_table, options
        resource.has_many has_many_resource_name, through: has_many_join_table
      end

    end
  end
end
