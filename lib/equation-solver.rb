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
OPS = /[+-=*]/

def format_equation(side)
	s = side.partition OPS
	s1, s2, s3 = s[0].to_i, s[1], s[2].to_i
	side = case s2
		when "+" then s1 + s3
		when "-" then s1 - s3
		when "/" then s1 / s3
		when "*" then s1 * s3
	end
	return side
end
def equation(equation, variable, set = -1000..1000)
	/\=/ =~ equation	
	left, right, fvalue = $~.pre_match, $~.post_match, nil
	varsub = proc { |side, value, variable| side.gsub(variable, value) }
	set = set.to_a
	for value in set
		l, r = format_equation(varsub.call(left, value.to_s, variable)), format_equation(varsub.call(right, value.to_s, variable))
		fvalue = value if l == r
	end
	return fvalue
end
			
        
