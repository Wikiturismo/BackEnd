class Valoration < ApplicationRecord
  belongs_to :place
  belongs_to :user

  def self.load_valorations(page = 1, per_page = 10)
    includes(place:[:commentplaces,:schedules],user:[:places])
      .paginate(:page => page, :per_page => per_page)
  end

  def self.lawea(page = 1, per_page = 10,columns)
    columns=columns ? columns+", user_id, place_id" : "valorations.*, user_id, place_id"
    load_valorations(page,per_page)
    .select(columns)
  end

  def self.valorations_by_id(id,columns)
    columns=columns ? columns+", user_id, place_id" : "valorations.*, user_id, place_id"
    includes(place:[:commentplaces,:schedules],user:[:places])
    .select(columns)
      .find_by_id(id)
  end

  def self.valorations_by_val(val,page=1, per_page = 10,columns)
    columns=columns ? columns+", user_id, place_id" : "valorations.*, user_id, place_id"
    load_valorations(page,per_page)
      .select(columns)
        .where("valorations.val = ?", val)
  end

  def self.valorations_by_userplace(user,place,page=1, per_page = 10,columns)
    columns=columns ? columns+", user_id, place_id" : "valorations.*, user_id, place_id"
    load_valorations(page,per_page)
      .select(columns)
        .where("valorations.user_id=? AND valorations.place_id=?" ,user, place)
  end
end
