# frozen_string_literal: true

# rubocop:disable Style/NumericLiterals, Style/StringLiterals, Metrics/LineLength, Metrics/MethodLength
def create_sample_database
  sample_database = [
    [1, "Order", 1484730554, "{\"customer_name\":\"Jack\",\"customer_address\":\"Trade St.\",\"status\":\"unpaid\"}"],
    [2, "Order", 1484730623, "{\"customer_name\":\"Sam\",\"customer_address\":\"Gecko St.\",\"status\":\"unpaid\"}"],
    [1, "Product", 1484731172, "{\"name\":\"Laptop\",\"price\":2100,\"stock_levels\":29}"],
    [1, "Order", 1484731481, "{\"status\":\"paid\",\"ship_date\":\"2017-01-18\",\"shipping_provider\":\"DHL\"}"],
    [2, "Product", 1484731671, "{\"name\":\"Microphones\",\"price\":160,\"stock_levels\":1500}"],
    [1, "Invoice", 1484731920, "{\"order_id\":7,\"product_ids\":[1,5,3],\"status\":\"unpaid\",\"total\":2500}"],
    [1, "Invoice", 1484732821, "{\"status\":\"paid\"}"]
  ]

  sample_database.each do |(object_id, object_type, timestamp, payload)|
    Event.create(object_id: object_id, object_type: object_type, timestamp: Time.at(timestamp.to_i), payload: JSON.parse(payload))
  end
end
# rubocop:enable Style/NumericLiterals, Style/StringLiterals, Metrics/LineLength, Metrics/MethodLength
