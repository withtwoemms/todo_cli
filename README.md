# TODO\_CLI.rb
---
02/24/2015


I am [@withtwoemms](https://twitter.com/withtwoemms) and I have made a simple todo list program that works interactively via the command line. It is an enhancement of a [team treehouse](http://teamtreehouse.com) project courtesy of [@jseifer](https://twitter.com/jseifer).

I will continue to update, in hopes (one day) that someone finds this useful enough to fork :)


## HOW IT WORKS

    * Download the "[todo\_cli](https://github.com/withtwoemms/todo_cli)" folder
    * Make sure the three essential files are present:

        * "todo.rb"
        * "todo_list.rb"
        * "todo_item.rb"

    * If you have ruby installed, type ```ruby todo.rb``` to begin

        * use a privilaged user or ```sudo ruby [file_name]``` if you plan on saving your list (I'm still getting acquainted with 'perms' in the ruby File class)

    * Choose option [1] to make a new list
    * Once you've named it, you can choose to add new items to your list by choosing option [2]. You can do this in batch -- i.e. type something, ```<enter>```, type something else ```<enter>```, etc...
    * There are options to remove items, complete, or "un-complete" them
    * Once you're ready to save your triumphs and goals for another day, you can choose option [6] to save. 

## Wishlist

    * Option/command to simply print list to screen
    * Open list from file
    * 'Serialize' into different DIFs like JSON

---
I've included an example output file called "groceries\_list.txt". Feel free to [send me](mailto:withtwoemms@gmail.com) comments or suggestions.
