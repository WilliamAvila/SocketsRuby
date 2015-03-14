require 'socket'
require_relative 'ValidateEmployee.rb'
require_relative 'Employee.rb'


$socket = TCPSocket.new('localhost',2000)




def insertEmployee()
    cod = 'insert,'

    code = generateCode()
    puts('Code: ' + code)

    cod2="unique,"
    cod2 += code

    puts cod2.length
    puts cod2


    $socket.write(cod2)

    res = $socket.recv(1024)


    if res == code then
        puts "Code already exists try again"
        return
    end


    emp = getValidatedEmployee(code);

    if(emp) then
        cod += emp.getEmployeeData();
    else
        return;
    end

    $socket.write(cod)
    puts $socket.recv(1024)
    puts("Employee Added Correctly \n")

end

def searchEmployee()
    cod = 'search,'
    puts('Enter Employee code: ')
    cod += gets

    cod =cod.chomp
    puts cod.length


    $socket.write(cod)
    res = $socket.recv(1024)


    if res.to_s != ' ' then
        print(res)
    elsif res then
        print('Not Found')
    end
end


def listEmployee()

   print("List Employees \n")
   cod = 'list'
   $socket.write(cod)
   puts $socket.recv(1024)
end

def getValidatedEmployee(code)

    puts('Enter Name: ')
    name = gets

    if(validateName(name)) then
        print(name + ' Is not valid')
        return null
    end

    puts('Enter Email: ')
    email = gets
    if(validateEmail(email)) then
        print(email + ' Is not valid')
        return null
    end

    puts('Enter Salary: ')
    salary = gets
    if(validateSalary(salary)) then
        print(salary + ' Is not valid')
        return null
    end

    puts('Enter ID: ')
    id = gets
    if(validateId(id)) then
        print(id + ' Is not valid')
        return null
    end

    puts('Enter Phone number: ')
    phone = gets
    if (validatePhone(phone)) then
        print(phone + ' Is not valid')
        return null
    end


    e = Employee.new(code,name,email,salary,id,phone)
    print("Validated")
    return e
end

while true
    print ("""
     1.Insert Employee
     2.Edit Employee
     3.Search Employee
     4.List Employee
     5.Exit

     """)
        puts("Enter Number: \n")
        val = gets

        if val.to_i == 1 then
           insertEmployee()
        elsif val.to_i  == 2 then
            editEmployee()
        elsif val.to_i  == 3 then
            searchEmployee()
        elsif val.to_i == 4  then
            listEmployee()
        elsif val.to_i  == 5
             break
        else
            print("Error")
        end

end
