class UserSerializer < ActiveModel::Serializer
  attribute :id, if: :render_id?
  attribute :name, if: :render_name?
  attribute :kind, if: :render_kind?
  attribute :email, if: :render_mail?
  attribute :ubication, if: :render_ubication?

  has_many :imageusers, if: :render_hasmany?
  has_many :commentplaces, if: :render_hasmany?
  has_many :commenttowns, if: :render_hasmany?
  has_many :places, if: :render_hasmany?

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
      if(instance_options[:columns].include?("name") || instance_options[:columns]=="all")
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

  def render_mail?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("email") || instance_options[:columns]=="all")
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
      if(instance_options[:columns].include?("ubication") || instance_options[:columns]=="all")
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
