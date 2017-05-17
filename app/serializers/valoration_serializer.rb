class ValorationSerializer < ActiveModel::Serializer
  attribute :id, if: :render_id?
  attribute :val, if: :render_val?
  belongs_to :place, if: :render_place?
  belongs_to :user, if: :render_user?

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

  def render_val?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("val")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_place?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("place")|| instance_options[:columns]=="all")
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
end
