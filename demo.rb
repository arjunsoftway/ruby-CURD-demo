require 'mysql2'

class Database

    def initialize(dbhost, dbport, dbname, dbuser, dbpass)

       @client = Mysql2::Client.new(  #Establishing the mySql Connection
	      :host => dbhost, 
	      :port => dbport, 
	      :database => dbname,
	      :username => dbuser, 
	      :password => dbpass,
	      :reconnect => true
	      )
       
    end

   # def call(env)
       # some logic that will call:
    #   results = _query(sql);
    #end

    def _query(sql)
    	results = @client.query(sql, :as => :hash)
    	results
    end

 end


class Crud < Database

	#alias_method :parent_method, :_query

	 def showData()
	 	 resultArray = _query('select * from test')
	 	 resultArray.each do |row|  puts row end
	 	 selectOption	
	 	  #puts resultArray.each do |row| { label: row['id'], value: row['my_name'] } end
	 end	

	 def createData()  # function for Inserting new record in to the database
	 	puts 'enter your name'
	 	my_name=gets.chomp
	 	resultArray = _query("insert into test (my_name) values ('#{my_name}')")
	 	selectOption
	 end	

	 def deleteRecord() # Delete the record from table
	 	#puts showData
	 	puts 'select id for deleting the record'
	 	selected_id=gets
        if !selectRow(selected_id)
        	puts "Empty record, There is no record with the id '#{selected_id}'"
        else	
	        puts 'Really you need to delete the above record? Y/N'
	        confirmation = gets.strip

	        if confirmation=='Y' or confirmation=='y' 
		 		resultArray = _query("delete from test where id='#{selected_id}'")
		 	elsif confirmation=='N' or confirmation=='n' 
		 		puts "Cancelled the delete operation"
		 	else
		 		puts "Entered wrong value"		
		 	end	
		end 	
	 	selectOption
	 end

	 def updateRecord()# Updated the record to table
	 	#puts showData
	 	puts 'select id for updating the record'
	 	selected_id=gets
	 	puts 'Enter the which you want update in the record'
	 	updatedvalue = gets.strip
	 	if !selectRow(selected_id)
	 		puts "Empty record, There is no record with the id '#{selected_id}'"
        else	
	        puts 'Really you need to update the above record? Y/N'
	        confirmation = gets.strip

	        if confirmation=='Y' or confirmation=='y'
	        	resultArray = _query("UPDATE  test SET my_name = '#{updatedvalue}' WHERE id = '#{selected_id}'")
	        elsif confirmation=='N' or confirmation=='n' 
		 		puts "Cancelled the delete operation"
		 	else
		 		puts "Entered wrong value"		
		 	end		
		end 	
	 	selectOption
	 	 		
	 end	

	 def selectRow(id) # Select row based on the id
	 	  system "clear"
	 	  resultArray = _query("select * from test where id='#{id}'")
	 	  if resultArray.count!=0
	 	  		resultArray.each do |row|  puts row end	
	 	  else
	 	  		return false
	 	  end
	 	  
	 end 	


	 def selectOption() # here we are providing the option Crud operation
	 	puts ''
	 	puts '************************************************'
	 	puts '1 for adding new record'
		puts '2 for view records'
		puts '3 for delete record'
		puts '4 for update record'
		puts '5 for Exit'

		puts 'select any of the option'
		option_selection= gets.strip

	 	case option_selection
			when '1'
				createData()
			when '2'
				showData()
			when '3'
				deleteRecord
			when '4'
				updateRecord
			when '5'
				system "clear"
				puts 'Thank you..!!!'
			else	
				system "clear"
				puts 'Entered wrong value, Please select value as per the list'
				selectOption		
			end	
	 end



end



object = Crud.new('localhost',nil,'ruby','root','root')
system "clear"
puts '************************************************'
puts 'Here I am welcoming you for CRUD operation'
puts 'Developer Arjun KP : arjun@softwasolutions.com'
puts 'Softway solutions Pvt Ltd, Developed in Ruby'
puts '************************************************'
object.selectOption()	
				
		

#object.showDatas()

#object.showDatas()


#records = resultArray.map do |row|{ label: row['id'], value: row['my_name'] } end
#	puts records
