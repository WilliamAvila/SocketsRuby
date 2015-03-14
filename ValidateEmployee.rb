def generateCode()
  chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ'
  code = ''
  2.times { code << chars[rand(chars.size)] }

  nums = '0123456789'
  2.times { code << nums[rand(nums.size)] }
  code

end

def validateName(name)
    if !/^[A-Za-z]*$/.match(name) then
        return true
    else
        return false
    end
end

def validateEmail(email)
    if !/^[A-Za-z0-9\.\+_-]+@[A-Za-z0-9\._-]+\.[a-zA-Z]*$/.match(email) then
        return true
    else
        return false
    end
end


def validateSalary(salary)
    if !/^[0-9]*$/.match(salary) then
        return true
    else
        return false
    end
end


def validateId(id)
    if !/^[0-9]{13}$/.match(id) then
        return true
    else
        return false
    end
end


def validatePhone(phone)
    if !/^[0-9]{8}$/.match(phone) then
        return true
    else
        return false
    end
end

puts(generateCode())
