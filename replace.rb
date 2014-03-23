#!/usr/bin/env ruby

# Simple class to do search and replace within a directory
class Replace

  def initialize(original, replacement)
    @original = original
    @replacement = replacement
  end

  # Loop through every file and perform search and replace
  def write_replace

    # First set the file locations only if the correct extension
    files = Dir.glob('**/**')

    files.each do |file_name|

      text = File.read(file_name)
      replace = text.gsub(@original, @replacement)
      File.open(file_name, 'w') { |file| file.puts replace }
      puts "Updating #{file_name}"
    end
  end
end

puts "\nWhat is the original string?"
original = gets.chomp

puts "\nWhat is the replacement string?"
replacement = gets.chomp

replace = Replace.new(original, replacement)
replace.write_replace