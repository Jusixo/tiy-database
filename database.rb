
class Person
attr_reader "name", "phone_number", "address", "position", "salary", "slack_account", "github_account"

  def initialize(name, phone_number, address, position, salary, _slack_account, github_account)
    @name = name
    @phone_number = phone_number
    @address = address
    @position = position
    @salary = salary
    @slack_account = slack_account
    @github_account = github_account
  end
end

class HumanDatabase
  def initialize
    @profiles = []
  end

  def initial_question
    puts "(a) Add a profile (s) Search for a profile (d) Delete a profile "
    initial = gets.chomp

  end

  def add_person
    puts "What is your name?"
    name = gets.chomp

    puts "What is your phone_number?"
    phone_number = gets.chomp

    puts "What is your address?"
    address = gets.chomp

    puts "What is your position?"
    position = gets.chomp

    puts "What is your salary?"
    salary = gets.chomp.to_i

    puts "what is your Slack Account?"
    slack_account = gets.chomp

    puts "what is your Git Account?"
    github_account = gets.chomp

    account = Person.new(name, phone_number, address, position, salary, slack_account, github_account)
    puts "The name for this account is #{account.name} Phone number is #{account.phone_number} you addrress is #{account.address} your current position is #{account.position} your current salary is #{account.salary} yours Slack Account is #{account.slack_account} and your Github Account is #{account.github_account}"

    @profiles << account
  end

  def search_person
    print "Please type in persons name. "
    search_name = gets.chomp
    @profiles.each do |person|
      if person.name == search_name
        puts "name: #{person.name}, phone number: #{person.phone_number}, address: #{person.address}, position: #{person.position}, current salary: #{person.salary}, slack_account: #{person.slack_account}, github_account: #{person.github_account} "
      else
        puts "Profile not found"
      end
    end
  end

  def delete_person
    index = 0
    print "Please type in persons name. "
    delete_name = gets.chomp
    @profiles.each do |person|
      if person.name == delete_name
        puts "#{delete_name}, has been deleted."
        @profiles.slice(index)
      else
        puts "Profile not found"
      end
      index += 1
    end
  end

  def start
    choice = ()
    while choice != ""
      choice = initial_question
      if choice == "a"
        add_person
      elsif choice == "s"
        search_person
      elsif choice == "d"
        delete_person
      else
        puts "progam closing 👋🏼"
      end
    end
  end
end

HumanDatabase.new.start
