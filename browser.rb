require 'net/http'
require 'nokogiri'
require 'uri'

require_relative 'page'

class Browser
  def run!
    # Run the browser
    # Display a prompt for a user
    puts "Which website would you like to explore?"
    print "Insert URL:"
    url = gets.chomp
    # Parse their input
    page = Page.new(url)
    page.fetch!
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
    until
        puts ""
        puts "Enter 'title' to view the webpage title"
        puts "Enter 'links' to view the webpage links"
        puts "Enter 'exit' to exit the browser"
        answer = gets.chomp
        if answer == 'title'
            puts page.title
        elsif answer == 'links'
            puts page.links
        elsif answer == 'exit'
            break
        else
            "Error! Please choose from the listed options."
        end                
    end
  end
end

Browser.new.run!