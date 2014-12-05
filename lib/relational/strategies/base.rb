module Relational
  module Strategies
    class Base
      attr_reader :resource, :resource_name, :join_table_name

      def initialize(options = {})
        @resource = options.fetch(:resource)
        @resource_name = options.fetch(:resource_name)
        @join_table_name = options.fetch(:join_table_name)
      end

      def apply
        resource.send(:has_many, has_many_join_table)
        resource.send(:has_many, has_many_resource_name, through: has_many_join_table)
      end

    end
  end
end
