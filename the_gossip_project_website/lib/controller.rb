# frozen_string_literal: true

require 'bundler'
Bundler.require

require 'gossip'
require 'comment'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    # page avec formulaire de création d'un gossip
    erb :new_gossip
  end

  post '/gossips/new/' do
    # action de créer un nouveau gossip
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id/' do
    # show un gossip
    erb :show, locals: { gossip: Gossip.find(params['id']), comments: Comment.find(params['id']) }
  end

  post '/gossips/:id/comment' do
    # action de créer un commentaire
    Comment.new(params['id'], params['comment_author'], params['comment_content']).save
    erb :show, locals: { gossip: Gossip.find(params['id']), comments: Comment.find(params['id']) }
  end

  get '/gossips/:id/edit/' do
    # page pour éditer un gossip
    erb :edit, locals: { gossip: Gossip.find(params['id']) }
  end

  post '/gossips/:id/edit/' do
    # action d'éditer le gossip
    Gossip.edit(params['id'], params['gossip_author'], params['gossip_content'])
    erb :show, locals: { gossip: Gossip.find(params['id']), comments: Comment.find(params['id']) }
  end
end
