require "spec_helper"
RSpec.describe instance_exec("5+3") do
  it {is_expected.to eq(8)}
end
