#!/usr/bin/env ruby

# Simple class to do search and replace within a directory
class Replace

  require 'fileutils'

  def initialize(backup, original, replacement)
    @backup = backup
    @original = original
    @replacement = replacement
  end

  # Loop through every file and perform search and replace
  def write_replace
    files = Dir.glob('**/**')

    files.each do |file_name|

      create_backup(file_name)
      text = File.read(file_name)
      replace = text.gsub(@original, @replacement)
      File.open(file_name, 'w') { |file| file.puts replace }
      puts "Updating #{file_name}"
    end
  end

  # If answered yes create backup
  def create_backup(file_name)
    if @backup == 'y' || @backup == 'yes'
      new_file = file_name + '.bak'
      FileUtils.cp file_name, new_file
    end
  end
end

# Questions asked

puts "\nWould you like to make a backup file?"
backup = gets.chomp

puts "\nWhat is the original string?"
original = gets.chomp

puts "\nWhat is the replacement string?"
replacement = gets.chomp

replace = Replace.new(backup, original, replacement)
replace.write_replace