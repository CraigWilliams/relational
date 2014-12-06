module Relational
  module Strategies
    class ThroughStrategy < Base

      def self.applicable_for?(options)
        options[:resource_name].to_s.include? 'through'
      end

      def has_many_join_table
        resource_name.to_s.split('through').last.to_sym
      end

      def has_many_resource_name
        resource_name.to_s.split('through').first.to_sym
      end

    end
  end
end
