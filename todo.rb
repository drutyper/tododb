require 'pry'
require './db/setup'
require './lib/all'

class Todo
  def initialize 
    print "Hello, what's your name? "
    @username = gets.chomp
    @user = User.where(name: @username).first_or_create!
  end

  def add_list 
    print "Title of list? "
    list = gets.chomp
    newly_created_list = @user.lists.create! title: list
    puts "#{list}"
    add_item newly_created_list
  end

  def add_item list
    print "What would you like to add to the list? "
    item = gets.chomp
    # id = gets.chomp
    # list = List.find(id)
    list.items.create! content: item
  end
  
  def mark
    print "What item ID would you like to mark as complete? "
    id = gets.chomp
    m = @user.todo_items.find(id)
    m.done = true
    m.save
    # note: need to add a done column to the items table
  end

  def due
  end

  def incomplete
    print "These are the items that have not been completed"
    d = done == false
    i = @user.todo_items.where("#{d}")
    print i
    # note: need to add a done column to the items table
  end

  def all
    l = @user.list.all
    print l
  end

  def next
  end

  def search
  end


  def get_commands
    puts "Hello #{@username}"
    puts "What would you like to do?"

    puts "Available commands: new list, add items, mark, due, incomplete, 
    all, next, search"
  


    command = gets.chomp

    case command 
      when "new list"
        add_list
      when "add items"
        add_items
      when "mark"
      when "due"
      when "incomplete"
      when "all time"
      else 
        "I don't know what #{command} is"
    end
  end
end

t = Todo.new 

t.get_commands





