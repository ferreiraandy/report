# encoding: UTF-8

class Salle < ActiveRecord::Base
  validates_presence_of :purchaser, :message => 'O campo "Comprador" é obrigatório.'
  validates_presence_of :unit_price, :message => 'O campo "Preço unitário" é obrigatório.'
  validates_presence_of :quantity, :message => 'O campo "Quantidade" é obrigatório.'
end
