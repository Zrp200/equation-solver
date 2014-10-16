Gem::Specification.new do |es|
  eq.version = "0.0.0"
  eq.version = "#{eq.version}-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS'] 
  eq.name = "equation-solver"
  eq.author = "Zachary Perlmutter"
  eq.email = "zrp200@gmail.com"
  eq.homepage = "https://www.github.com/Zrp200/equation-solver"
  eq.files = ["equation-solver.rb"]
  eq.extra_rdoc_files = %w(README.md LICENSE)
  eq.license = "MIT"
end
