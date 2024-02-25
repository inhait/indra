require 'socket' 

TIMEOUT = 2

def Checking(port)
    socket      = Socket.new(:INET, :STREAM)
    remote_add  = Socket.sockaddr_in(port, 'www.host.com')

    begin
        socket.connect_nonblock(remote_addr)
    rescue Errno:EINPROGRESS
    end

    _, sockets, _ = IO.select(nil [socket], nil, TIMEOUT)

    if sockets
        p "Port #{port} is open"
    else
    
    end
end

PORT_LIST = [21,22,23,25,53,80,443,3306,8080]
threads   = []

PORT_LIST.each { |i| threads << Thread.new { scan_port(i) }}

threads.each(&:join)


