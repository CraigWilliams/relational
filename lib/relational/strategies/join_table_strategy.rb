module Relational
  module Strategies
    class JoinTableStrategy < Base

      def self.applicable_for?(options)
        options[:resource_name].present? && options[:join_table_name].nil?
      end

      def has_many_join_table
        resource_name
      end

      def has_many_resource_name
        resource_name.to_s.split('_').first.to_sym
      end

    end
  end
end
