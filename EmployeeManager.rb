require_relative 'Employee.rb'



def insertEmployee(emp)
  open('Employee.txt', 'a') do |f|
    f.puts emp
  end
end

def listEmployees()
  str=""
  open('Employee.txt', 'r') do |f1|
    while line = f1.gets
      str += line
      puts line
    end
  end
  return str
end


def searchEmployee(id)
    if id.length==4 then
      open('Employee.txt', 'r') do |f1|
        while line = f1.gets
          if line.to_s.include? id.to_s then
            return line
          end
        end
      end
    end
    return ' '
end


def findValue(val)
  open('Employee.txt', 'r') do |f1|
    while line = f1.gets
      for part in line.split()
          if part.to_s.include? val.to_s then
              return val
          end
      end
    end
  end
    return ' '
end

#emp = Employee.new("aa11","William","william.zx1@gmail.com","0","1804199301762","33165891")
#listEmployees()
