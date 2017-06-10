class Imagetown < ApplicationRecord

  belongs_to :town

  validates :path, length: {minimum: 3, message: "Debe ser mayor a 3 caracteres"}

  def self.load_imagetowns(page = 1, per_page = 10)
        includes(town:[:commenttowns])
        .paginate(:page => page, :per_page => per_page)
    end
  def self.imagetowns_by_id(id)
    includes(town:[:commenttowns])
    .find_by_id(id)
  end

  def self.imagetowns_by_town(name,page, per_page = 10)
      joins(:town).select("imagetowns.*, towns.id,imagetowns.id")
          .where("lower(towns.name) = ? AND imagetowns.town_id=towns.id", name.downcase)
            .includes(town:[:commenttowns])
                  .paginate(:page => page,:per_page => per_page)
  end
mount_uploader :image, ImagetownsUploader
end
