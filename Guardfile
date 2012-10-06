# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard :ruby
guard :rack, :port => '4567'

guard :bundler do
  watch('Gemfile')
end

guard :rspec do
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
end
