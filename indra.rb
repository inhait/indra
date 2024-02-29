
#!/usr/bin/ruby

require 'socket'
require 'timeout'

$rhost = ARGV[0]
$min_port = ARGV[1]
$max_port = ARGV[2]
