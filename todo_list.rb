require "./todo_item"

class TodoList

    attr_reader :name, :todo_items

    def initialize(name)
        @name = name
        @todo_items = []
    end

    def add_item(name)
        @todo_items << TodoItem.new(name)
    end

    def remove_item(name)
        index = find_index(name)
        @todo_items.delete_at(index)
    end

    def find_index(name)
        index = 0
        flag = false
        @todo_items.each {|todo_item|
            if todo_item.name == name 
                found = true
            end
            if found
                return index
            else
                index += 1
            end
        }
        return nil
    end

    def contains?(name)
        if find_index(name) == nil
            return false
        else 
            return true
        end
    end
    
    def mark_complete(name)
        this_item = find_index(name)
        if this_item == nil
            puts "...item not listed..."
        else
        @todo_items[this_item].mark_complete!
        end
    end

    def mark_incomplete(name)
        this_item = find_index(name)
        if this_item == nil
            puts "...item not listed..."
        else
        @todo_items[this_item].mark_incomplete!
        end
    end

    def print_list(kind="all")
        list = []

        header = "#{name} List -- #{kind} items\n" + "-" * 30
        puts header
        list << header

#        if kind == "all"
            @todo_items.each {|item|
                case kind
                when "all"
                    puts item
                    list << item
                when "complete"
                    puts item if item.complete?
                    list << item if item.complete?
                when "incomplete"
                    puts item if !item.complete?
                    list << item if !item.complete?
                end
            }
=begin
        elsif kind == "completed" 
            @todo_items.each {|item|
                if item.complete?
                    puts item
                end
            }
        elsif kind == "incompleted"
            @todo_items.each {|item|
                if !item.complete?
                    puts item
                end
            }
=end
#        end
        print "\n"
        return list.join("\n")
    end
end

=begin
todo_list = TodoList.new("Groceries")
todo_list.add_item("Milk")
todo_list.add_item("Eggs")
todo_list.add_item("Bread")

todo_list.print_list

puts todo_list.inspect
todo_list.remove_item("Eggs")
puts todo_list.inspect
todo_list.add_item("Eggs")
puts todo_list.mark_complete("Eggs")
puts todo_list.inspect

todo_list.print_list
todo_list.print_list("incomplete")
todo_list.print_list("complete")

puts todo_list.contains?("Milk")
=end
