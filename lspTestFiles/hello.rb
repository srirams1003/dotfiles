# Sample Ruby file for LSP testing

class SampleClass
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, #{@name}!"
  end
end

sample_instance = SampleClass.new("Alice")
sample_instance.greet

