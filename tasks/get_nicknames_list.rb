#!/usr/bin/env ruby

require 'rubygems'
require 'facets'

# Other sources:
#   http://answers.google.com/answers/threadview?id=778986
#   http://www.geocities.com/edgarbook/names/other/nicknames.html

local_file_path = '/tmp/nicknames.txt'
unless FileTest.exist?( local_file_path )
  system("wget http://deron.meranda.us/data/nicknames.txt -O #{local_file_path}")
end

File.open(local_file_path, 'r').each_line do |line|
  next if line =~ /^#/
  a, b, probability = line.split(/\s+/).map(&:downcase)
  puts "%w[#{a.ljust(20)} #{b.ljust(20)}],"
end

