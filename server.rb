require 'socket'
require_relative 'EmployeeManager.rb'

server = TCPServer.new 2000 # Server bound to port 2000
client = server.accept    # Wait for a client to connect


while true

    d = client.recv(1024)
    tokens = d.split(",")

    if tokens[0] == 'list' then
        val = listEmployees()
        client.write(val)
        next

    elsif tokens[0].to_s == 'search' then
        print tokens[1].length
        val = searchEmployee(tokens[1])

        client.write(val)
        next


    elsif tokens[0] == 'insert' then
        print(tokens[1])
        insertEmployee(tokens[1])
        next

    elsif tokens[0] == "unique" then
        print(tokens[1])

        val = findValue(tokens[1])
        print val
        client.write(val)
      next

    end


    client.close
end
