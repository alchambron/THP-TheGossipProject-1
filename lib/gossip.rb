# Requiring the gem CSV to abling storage on a csv file
require 'csv'

# Creating a class to store all the functionnality of the app
class Gossip
  attr_accessor :author, :content

  # initialize the data
  def initialize(author, content)
    @author = author
    @content = content
  end

  # Def to add the result of the form into the CSV
  def save
    CSV.open('./db/gossip.csv', 'ab') do |csv|
      csv << ["#{@author}", "#{@content}"]
    end
  end

  # Def to show all the gossip and return as an array
  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  # Def to search a specific gossip
  def self.find(id)
    finds = []
    Gossip.all.each do |i|
      finds << i
    end
    finds[id]
  end
end
