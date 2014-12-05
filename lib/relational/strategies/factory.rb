module Relational
  module Strategies
    NotFound = Class.new(NoMethodError)

    module Factory

      def self.for(options = {})
        available_strategies.each do |strategy|
          if strategy.applicable_for?(options)
            return strategy.new(options)
          end
        end
        raise RelationalStrategyNotFoundError, "No strategy found for options: #{options}"
      end

      def self.available_strategies
        [
          JoinTableStrategy,
          BothValuesStrategy
        ]
      end
    end
  end
end
