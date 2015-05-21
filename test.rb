$doller=56;

class TestClass

	@@times=0
	@@total=0
	@amount=0
	@quantity=0

	def test1(amnt, qty) 
	
		@@times++
		@@total+=@amount*@quantity
	    return @@total
	end

	def test2()
		
		return @@total*$doller
	end

	def valPrint
		puts " times value : #{@@times}"
		puts "Total amount: #{@@total}"
   end	

end


firstObject=TestClass.new
puts "Total amount will print based on the parameter :"
puts firstObject.test1(10,5)
puts "Total amount * doller value";
puts firstObject.test2
puts firstObject.valPrint


puts "second object starting from here"

secondObject=TestClass.new
puts "Total amount will print based on the parameter :"
puts secondObject.test1(10,5)
puts "Total amount * doller value";
puts secondObject.test2
puts secondObject.valPrint

