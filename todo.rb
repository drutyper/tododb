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
    @user.lists.create! title: list
    print "#{list}"
  end

  def add_item
    @user.item.create!
  end
  
  def mark
  end

  def due
  end

  def incomplete
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

t = Todo.new 

t.get_commands

end



