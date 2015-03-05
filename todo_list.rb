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
        # using "case/when" may be 'prettier' here
        # need 'proper' error (raise or throw?) if not String or Fixnum
        if /\D/.match(name) || /^$/.match(name) #name.class == String
            #puts "!!! Received the non-digit: #{name}"
            index = find_index(name)
            @todo_items.delete_at(index)
        elsif /\d/.match(name) #name.class == Fixnum
            #puts "!!! Received the digit: #{name}"
            remove_item_by_index(name)
        else
            puts "\n"
            puts "!!! You gotta give me either the index or the list item."
        end
    end

    def remove_item_by_index(num)
        remove_item(find_item(num))
    end

    def find_item(num)
        num = num.to_i
        num -= 1
        return @todo_items[num].name unless @todo_items == nil
        return "...Index not in range. Please try again."
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
        list << header #may come in handy someday

        @todo_items.each_with_index {|item,i|
            # item in the block is of the TodoItem class
            case kind
            when "all"
                puts "#{i+1}. " + item.to_s
                list << item
            when "complete"
                puts "#{i+1}. " + item.to_s if item.complete?
                list << item if item.complete?
            when "incomplete"
                puts "#{i+1}. " + item.to_s if !item.complete?
                list << item if !item.complete?
            end
        }

        print "\n"
        return list.join("\n")
    end
end
