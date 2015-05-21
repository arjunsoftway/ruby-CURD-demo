class Parent

 def initialize(variable)
    puts 'parnt Class'
 end

 def test(val)
    puts 'I am inside Parent class'
 end	

end

class Child < Parent

alias_method :parentTest, :test 

 def initialize(test)
 	super
   puts 'Child Class'
 
 end	

 def testchild()
 	test('test')
 end	


end	

obj= Child.new(132)
obj.testchild