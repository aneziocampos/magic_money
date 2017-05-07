module Operators
  [:/, :*, :+, :-, :==, :>, :<].each do |operator|
    define_method(operator) do |value|
      result = @amount.send(operator, parse_operation_param(value))
      boolean?(result) ? result : "#{ result } #{ @currency }"
    end
  end

  private
  def parse_operation_param(value)
    value.kind_of?(MagicMoney) ? value.convert_to(@currency).amount : value
  end

  def boolean?(value)
    [true, false].include?(value)
  end
end
