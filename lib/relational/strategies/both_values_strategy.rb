module Relational
  module Strategies
    class BothValuesStrategy < Base

      def self.applicable_for?(options)
        options[:resource_name].present? &&
        options[:join_table_name].present? &&
        !options[:resource_name].to_s.include?('through')
      end

      def has_many_join_table
        join_table_name
      end

      def has_many_resource_name
        resource_name
      end

    end
  end
end
