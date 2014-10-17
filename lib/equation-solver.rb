=begin
parameters left and right must be Strings.
parameter set may be a range or an Array. It can also be left alone.
parameter variable must be a String or Regexp.
equation("5*x", "10", "x") will return "x = 2"
=end
class Equation
	def initialize(equation, variable, set=(-100..100))
		raise StandardError unless variable.match equation
	end
end
def equation(equation, variable, set = -1000..1000)
	variable = Regexp.new variable
	/\=/ =~ equation	
	left, right = $~.pre_match, $~.post_match
	varsub = proc { |side, value, variable| side.gsub(variable, value) }
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
			
        
