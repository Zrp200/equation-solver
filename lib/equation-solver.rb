=begin
parameters left and right must be Strings.
parameter set may be a range or an Array. It can also be left alone.
parameter variable must be a String or Regexp.
equation("5*x", "10", "x") will return "x = 2"
=end
class Equation
	def initialize(equation, variable, set=(-100..100))
		raise StandardError unless variable == equation
	end
end
OPS = /[\+\-\=\*\/]/
FORMAT = proc do |side|
	s = side.partition OPS
	s1, s2, s3 = s[0].to_i, s[1], s[2].to_i
	side = case s2
		when "+" then s1 + s3
		when "-" then s1 - s3
		when "/" then s1 / s3
		when "*" then s1 * s3
	end
end
def equation(equation, variable, set = -1000..1000)
	/\=/ =~ equation	
	left, right = $~.pre_match, $~.post_match
	varsub = proc { |side, value, variable| side.gsub(variable, value) }
	set = set.to_a
	for value in set
		l, r = varsub.call(left, value.to_s, variable), varsub.call(right, value.to_s, variable)
		FORMAT.call l
		FORMAT.call r
		if l == r
			final = "#{variable.to_s} = #{value}"
		end
	end
	return final
end
			
        
