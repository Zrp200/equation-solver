=begin
parameters left and right must be Strings.
parameter set may be a range or an Array. It can also be left alone.
parameter variable must be a String.
equation("5*x", "10", "x") will return "x = 2"
=end
def equation(left, right, variable, set = -1000..1000)
	varsub = proc do |side, value, variable|
		side.gsub(variable, value).to_i
	end
	set = set.to_a
	for value in set
		l, r = varsub.call(left, value.to_s, variable).to_i, varsub.call(right, value.to_s, variable).to_i
		if l == r
			final = "#{variable} = #{value}"
		end
	end
	final = "x == nil" if nil
	return final
end
			
        
