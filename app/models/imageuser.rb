class Imageuser < ApplicationRecord

  belongs_to :user

  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}

  def self.load_imageusers(page = 1, per_page = 10)
        includes(user:[:places])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.imageusers_by_id(id)
    includes(user:[:places])
    .find_by_id(id)
  end

  def self.imageusers_by_user(name,page, per_page = 10)
      joins(:user).select("imageusers.*, users.id,imageusers.id")
          .where("lower(users.name) = ? AND imageusers.user_id=users.id", name.downcase)
            .includes(user:[:places])
                  .paginate(:page => page,:per_page => per_page)
  end
mount_uploader :image, ImageusersUploader
end
