require "equation-solver"
RSpec.describe equation("5+x=10-x", /x/, 1..10) do
  	it {is_expected.to eq("x = 5")}
end
