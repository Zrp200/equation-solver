require "spec_helper"
RSpec.describe exec("5+3") do
  it {is_expected.to eq(8)}
end
