def check_usage
  unless ARGV.length == 2
    puts "Usage: differences.rb old-inventory new-inventory"
    exit
  end
end

def boring?(line, boring_words)
  boring_words.any? do | a_boring_word |
    contains?(line, a_boring_word)
  end
end

def contains?(line, string)
  line.chomp.split('/').include?(string)
end

def inventory_from(filename)
  downcased = File.open(filename).collect do | line |
    line.downcase
  end
  downcased.reject do | line |
    boring?(line, ['temp', 'recycler'])
  end
end

def compare_inventory_files(old_file, new_file)
  old_inventory = inventory_from(old_file)
  new_inventory = inventory_from(new_file)

  puts "Number of files added to the old inventory:"
  no_of_files_added = (new_inventory - old_inventory).length
  puts no_of_files_added

  puts "Number of files deleted from old inventory:"
  no_of_files_deleted = (old_inventory - new_inventory).length
  puts no_of_files_deleted

  puts "Number of files unchanged:"
  no_of_files_unchanged = (new_inventory - (new_inventory - old_inventory)).length
  puts no_of_files_unchanged

  puts ""
  puts "The following files have been added:"
  puts new_inventory - old_inventory

  puts ""
  puts "The following files have been deleted:"
  puts old_inventory - new_inventory
end

if $0 == __FILE__
  check_usage
  compare_inventory_files(ARGV[0], ARGV[1])
end
