require "./todo_list.rb"

class TodoMenu

    attr_reader :menu_items, :list_name

    def initialize
        #@menu_items = ["Make new list?","Add list item","Remove list item","Complete list item","Un-complete list item"] 
        @menu_items = {1=>"Make new list?",2=>"Add list item",3=>"Remove list item",4=>"'Complete' list item",5=>"'Un-complete' list item",6=>"Save list to file"} 
        display_menu
    end

    def display_menu
        puts "\n<<Menu Options>>"
        @menu_items.values.each {|item|
            puts "\t~~> [#{@menu_items.key(item)}] " + item
        } 
        puts "\n...choose a menu item:"
        choose_menu_item
    end

    def choose_menu_item(num=(gets.chomp.to_i))
        ### finish fashioning such that choosing option 1 removes it; makes it unavailable
        opt_new_list = @menu_items[1]
        opt_add = @menu_items[2]
        opt_remove = @menu_items[3]
        opt_complete = @menu_items[4]
        opt_uncomplete = @menu_items[5]
        opt_save = @menu_items[6]
        #puts "length is " + @menu_items.length.to_s

        case num
        when @menu_items.key(opt_new_list) #&& @menu_items.include?("Make new list?")
            if @menu_items.length == 6
            @menu_items.shift
            opt_new_list = nil
            opt_add = @menu_items[2]
            opt_remove = @menu_items[3]
            opt_complete = @menu_items[4]
            opt_uncomplete = @menu_items[5]

            puts "\n<<Making new list>>"
            puts "What would you like to name your new list?"
            @list_name = gets.chomp
            @todo_list = TodoList.new(@list_name)
            puts "\n"
            @todo_list.print_list
            puts "\n"
            display_menu
            else
                puts "\nOption not available. Choose another."
                display_menu
            end
        when @menu_items.key(opt_add)
            if @menu_items.length == 5
            puts "\nAdd some items to your list."
            puts "(press [enter] on empty when done)"
            while true
                item = get_item_name
                @todo_list.add_item(item)
                if item == ""
                    @todo_list.remove_item("")
                    break
                end
            end 
            #@todo_list.add_item(name=gets.chomp)
            @todo_list.print_list
            puts "\n"
            display_menu
            end
        when @menu_items.key(opt_remove)
            if @menu_items.length == 5
            puts "\nRemove an Item from your list." 
            @todo_list.remove_item(name=gets.chomp)
            @todo_list.print_list
            puts "\n"
            display_menu
            end
        when @menu_items.key(opt_complete)
            if @menu_items.length == 5
            puts "\nMark an item as 'completed'" 
            @todo_list.mark_complete(name=gets.chomp)
            @todo_list.print_list
            puts "\n"
            display_menu
            end
        when @menu_items.key(opt_uncomplete)
            if @menu_items.length == 5
            puts "\nMark an item as 'incomplete'" 
            @todo_list.mark_incomplete(name=gets.chomp)
            @todo_list.print_list
            puts "\n"
            display_menu
            end
        when @menu_items.key(opt_save)
            if @menu_items.length == 5
            puts "\nSave your current list"

            file_name = "#{@list_name}_list.txt" 
            file = File.open(file_name,"w")
            list_out = @todo_list.print_list
            #file.syswrite(list_out)
            file.puts(list_out.to_s)
            #file.puts("hello, file!")
            file.close
            
            puts "\n...File saved as #{file_name} in current directory...\n"
            display_menu
            end
        else 
            puts "Option not available. Please choose from the following:\n"
            display_menu
        end
        
        display_menu
    end

    def get_list_name
        puts "What's the name of your To-Do list?"
        return gets.chomp
    end

    def get_item_name
        return gets.chomp
    end
end

TodoMenu.new
