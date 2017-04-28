class PlaceSerializer < ActiveModel::Serializer

  attribute :id, if: :render_id?
  attribute :name, if: :render_name?
  attribute :state, if: :render_state?
  attribute :description, if: :render_description?
  attribute :ubication, if: :render_ubication?
  attribute :address, if: :render_address?
  attribute :kind, if: :render_kind?
  attribute :valoration, if: :render_valoration?
  attribute :valone, if: :render_valone?
  attribute :valtwo, if: :render_valtwo?
  attribute :valthree, if: :render_valthree?
  attribute :valfour, if: :render_valfour?
  attribute :valfive, if: :render_valfive?
  attribute :entrycost, if: :render_entrycost?
  belongs_to :user, if: :render_user?
  belongs_to :town, if: :render_town?
  belongs_to :depart, if: :render_depart?
  has_many :commentplaces, if: :render_hasmany?
  has_many :schedules, if: :render_hasmany?
  has_many :imageplaces, if: :render_hasmany?

  def render_id?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("id") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_name?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("name")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_state?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("state")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_description?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("description") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_ubication?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("ubication")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_address?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("address")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_kind?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("kind") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valoration?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valoration")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valone?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valone")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valtwo?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valtwo") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valthree?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valthree")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valfour?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valfour")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_valfive?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("valfive")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_entrycost?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("entrycost")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_user?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("user")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_depart?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("depart")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_town?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("town")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_hasmany?
    if(instance_options[:columns])
      if(instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

end
