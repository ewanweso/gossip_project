# frozen_string_literal: true

require 'csv'
require 'pry'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
    puts "Gossip saved in .CSV file."
  end

  def self.all
    # on crée une array qui va contenir tous nos gossips
    all_gossips = []
    table = CSV.read("db/gossip.csv")
    table.each do |gossip|
      gossip_provisoire = Gossip.new(gossip[0], gossip[1])
      all_gossips << gossip_provisoire
    end
    all_gossips
  end

  def self.find(id)
    # on retrouve un gossip en utilisant son id
    Gossip.all[id.to_i - 1]
  end

  def self.edit(id, author, content)
    # on passe en paramètres l'id du gossip à modifier, le nouvel auteur, le nouveau contenu
    gossips_array = CSV.read("db/gossip.csv")
    # on lit notre fichier ce qui retourne une array d'arrays
    gossips_array[id.to_i - 1] = [author, content]
    # on sélectionne le gossip à modifier, on passe les nouvelles infos

    CSV.open("./db/gossip.csv", "w") do |csv|
      # on réécrit notre fichier gossip.csv
      gossips_array.each do |row|
        csv << row
      end
    end
    puts "Gossip edited in .CSV file."
  end
end
