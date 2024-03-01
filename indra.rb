require 'socket'
require 'timeout'

$rhost = ARGV[0]
$min_port = ARGV[1]
$max_port = ARGV[2]

begin
    if (Integer $min_port) <= (Integer $max_port)
        $to_scan = ((Integer $min_port)..(Integer $max_port)).to_a
    else
        puts "[!] Error: Invalid Range of Ports"
        exit
    end
    
rescue ArgumentError
    puts "[!] Error: Invalid Range of Ports"
    exit
end
# ------
def scanport(port)
    s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
    begin
        sockadd = Socket.pack_sockaddr_in(port, $rhost)
    rescue
        puts "[!] Error: Failed to Resolve Target "
        exit
    end
timeout(10) do
        begin
            @result = s.connect(sockaddr)
        rescue
            return false
        end
    end
    if @result == 0
        return true
    else
        return false
    end
    #----------------------
end
    puts "[*] Beginning Scan... \n\n"
        $to_scan.each do |port|

    if scanport(port)
        puts "Port " + port.to_s + ": Open"
    end
end  