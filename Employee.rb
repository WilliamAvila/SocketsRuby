class Employee

    attr_accessor :codeEmployee,:name,:email,:salary,:id,:phone

    def initialize(codeEmployee, name, email, salary, id, phone)
        @codeEmployee = codeEmployee
        @name = name
        @email = email
        @salary = salary
        @id=id
        @phone = phone
    end



    def displayEmployee()
        print "Name : ", @name,  ", Salary: ", @salary
    end

    def getEmployeeData()
        st = @codeEmployee+" "
        st += @name+" "+@email+" "+@salary+" "+@id+" "+@phone+"\n"
        return st
    end

end
