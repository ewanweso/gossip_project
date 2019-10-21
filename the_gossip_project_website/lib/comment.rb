# frozen_string_literal: true

require 'csv'
require 'pry'

class Comment
  attr_accessor :gossip_id, :comment_author, :comment_content

  def initialize(gossip_id, comment_author, comment_content)
    @comment_author = comment_author
    @comment_content = comment_content
    @gossip_id = gossip_id
  end

  def save
    CSV.open("./db/comment.csv", "ab") do |csv|
      csv << [@gossip_id, @comment_author, @comment_content]
    end
    puts "Comment saved in .CSV file."
  end

  def self.all
    all_comments = []
    table = CSV.read("db/comment.csv")
    table.each do |comment|
      comment_provisoire = Comment.new(comment[0], comment[1], comment[2])
      all_comments << comment_provisoire
    end
    all_comments
  end

  def self.find(id)
    # trouve tous les commentaires liés à l'id d'un gossip
    # va nous servir à afficher les commentaires d'un gossip
    Comment.all.select do |comment|
      comment.gossip_id == id
    end
  end
end
