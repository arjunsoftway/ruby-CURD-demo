require 'fileutils'

class FileOperation

	def createfile(directoryName,fileName,extention) # Create file with directry

		if directoryName !=''
			fileNameWithdir = directoryName.to_s << '/' << fileName.to_s << '.' <<extention.to_s
			
			directoryName =File.dirname(fileNameWithdir)
			
			unless File.directory?(directoryName)
	  			if FileUtils.mkdir_p(directoryName)
	  				puts fileNameWithdir
	  				File.new(fileNameWithdir,'w')
		  			puts 'Yes, File created'
	  			else
	  				puts "OOP's something wrong, Please try again"
	  			end	
	  		else
	  			fileNameWithdir = directoryName << '/' << fileName.to_s << '.' <<extention.to_s
				puts fileNameWithdir
				File.new(fileNameWithdir.to_s,'w')
	  	
			end
		else
			fileName=fileName.to_s << '.' <<extention.to_s
			if File.exist?(fileName)
				puts "File already exist, Do you want overwrite the file Y/N"
				confirmation = gets.strip
		        if confirmation=='Y' or confirmation=='y'
		        	File.new(fileName,"w")
					puts "New file created"	

		        elsif confirmation=='N' or confirmation=='n' 
			 		puts "Cancelled the delete operation"
			 	else
			 		puts "Entered wrong value"		
			 	end	

			else
				puts fileName
				File.new(fileName,"w")
				puts "New file created"
			end	

		end	
      	selectOption     
		  

	end
		
	def readfile(directoryName,fileName,extention)  # read file
        
		begin

			if directoryName !=''	
				fileNameWithdir = directoryName.to_s << '/' << fileName.to_s << '.' << extention.to_s
				directoryName =File.dirname(fileNameWithdir)
				unless File.directory?(directoryName)
					puts "directory '#{directoryName}' is not available, Please try again"
					selectOption
				end	
			else
				fileNameWithdir = fileName.to_s << '.' << extention.to_s
			end

			counter=0

			if File.exist?(fileNameWithdir)

				file = File.open(fileNameWithdir,'r')
				puts "********** #{fileNameWithdir} - File Content************"
				 while (line = file.gets)
						puts "#{line} "
						counter=counter+1
					end
				if(counter<=0)
					puts "Empty file"
				end	
				puts "Total number of lines in the file : #{counter}"
				puts "*****************************************"
			else
				puts "#{fileNameWithdir} not exist!!"
			end	



		rescue => err
			puts "Exeption #{err}"
		end
		selectOption

	end	

	def deleteFile(directoryName,fileName,extention)
		begin
			puts "Are you sure, want to delete the file? Y/N"
			confirmation = gets.strip
	        if confirmation=='Y' or confirmation=='y'
				if directoryName!=''	
					fileNameWithdir = directoryName.to_s << '/' << fileName.to_s << '.' << extention.to_s
					directoryName =File.dirname(fileNameWithdir)
					unless File.directory?(directoryName)
						puts "directory '#{directoryName}' is not available, Please try again"
						selectOption
					end	
				else
					fileNameWithdir =  fileName.to_s << '.' << extention.to_s
				end

				if File.exist?(fileNameWithdir)
					FileUtils.rm_rf("#{fileNameWithdir}", secure: true)
					puts "#{fileNameWithdir} Deleted successfuly"
				else
					puts "File not exist, Please try again"
				end	

	        elsif confirmation=='N' or confirmation=='n' 
		 		puts "Cancelled the delete operation"
		 	else
		 		puts "Entered wrong value"		
		 	end	

			

		rescue => err
			puts "Exeption #{err}"
		end
		selectOption
	
	end


	def writeIntoFile(directoryName,fileName,extention)
		begin

			if directoryName!=''	
				fileNameWithdir = directoryName.to_s << '/' << fileName.to_s << '.' << extention.to_s
			else
				fileNameWithdir =  fileName.to_s << '.' << extention.to_s
			end

			if File.exist?(fileNameWithdir)
				puts "Please enter the value to write"	
				fileContent=gets
				#File.write(fileNameWithdir, fileContent)
				if File.open(fileNameWithdir, "a+"){|f| f << fileContent }
					puts "Text updated to the file #{fileNameWithdir}"
				else
					puts "Something wrong, Please try again"
				end	
			else
				puts "#{fileNameWithdir}File not exist, Please try again"
			end	
			
		rescue  => err
			puts "Exception #{err}"
		end
		selectOption
	end



	def createDirectory(directoryName)

		begin
			
			if File.directory?(directoryName)
				puts "Directory #{directoryName} already exist"
			else
				if FileUtils.mkdir_p(directoryName)
					puts "Directory #{directoryName} Created successfuly"
				else
					puts "Something wrong, Please try again"
				end	
			end
		rescue => err
			puts "Exeption #{err}"
		end
		selectOption		

	end

	def deleteDirectory(directoryName)
		begin

			puts "Really you want to delete the folder #{directoryName} ? Y/N"
			confirmation = gets.strip
			if confirmation=='Y' or confirmation=='y'	 

				if Dir["#{directoryName}/*"].empty?
					 FileUtils.rm_rf(directoryName)
				else
					puts "Folder having some files, Realy you want to delete the files? Y/N"
					confirmation = gets.strip
			        if confirmation=='Y' or confirmation=='y'
			        	FileUtils.rm_rf(directoryName)	

			        elsif confirmation=='N' or confirmation=='n' 
				 		puts "Cancelled the delete operation"
				 	else
				 		puts "Entered wrong value"		
				 	end	
				end
			elsif confirmation =="N" or confirmation=="n"
				puts "Cancelled the delete operation"
			else
				puts "Entered Wrong valud, Please enter Y/N"
			end	


		rescue err
			puts "Exeption #{err}"
		end
		selectOption
	end


	def selectOption() # here we are providing the option Crud operation
	 	puts ''
	 	puts '************************************************'
	 	puts '1 for creating new file'
		puts '2 for reading file'
		puts '3 for delete file'
		puts '4 for write Content into file'
		puts '5 for create folder'
		puts '6 for delete folder'
		puts '7 for Exit'

		puts 'select any of the option'
		option_selection= gets.strip

	 	case option_selection
			when '1'
				puts 'Please enter directory name'
				directory=gets.strip
				puts 'Please enter new file name'
				filename=gets.strip
				puts 'Please enter extention'
				extention=gets.strip
				createfile(directory,filename,extention)

			when '2'
				puts 'Please enter directory name'
				directory=gets.strip
				puts 'Please enter new file name'
				filename=gets.strip
				puts 'Please enter extention'
				extention=gets.strip
				readfile(directory,filename,extention)
			when '3'
				puts 'Please enter directory name'
				directory=gets.strip
				puts 'Please enter new file name'
				filename=gets.strip
				puts 'Please enter extention'
				extention=gets.strip
				deleteFile(directory,filename,extention)
			when '4'
				puts 'Please enter directory name'
				directory=gets.strip
				puts 'Please enter new file name'
				filename=gets.strip
				puts 'Please enter extention'
				extention=gets.strip
				writeIntoFile(directory,filename,extention)
			when '5'
				puts 'Please enter new folder name'
				directoryName=gets.strip
				createDirectory(directoryName)
			when '6'
				puts 'Please enter name of the folder,  need to be deleted'
				directoryName=gets.strip
				deleteDirectory(directoryName)
			when '7'
				system "clear"
				puts 'Thank you..!!!'
			else	
				system "clear"
				puts 'Entered wrong value, Please select value as per the list'
				selectOption		
			end	
	 end



end



object = FileOperation.new
system "clear"
puts '************************************************'
puts 'Here I am welcoming you for CRUD operation'
puts 'Developer Arjun KP : arjun@softwasolutions.com'
puts 'Softway solutions Pvt Ltd, Developed in Ruby'
puts '************************************************'
object.selectOption()	
	