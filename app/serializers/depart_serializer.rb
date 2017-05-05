class DepartSerializer < ActiveModel::Serializer
  attribute :id, if: :render_id?
  attribute :name, if: :render_name?
  attribute :capital, if: :render_capital?
  attribute :demonym, if: :render_demonym?
  has_many :towns, if: :render_town?
  has_many :imagedeparts, if: :render_imagedepart?

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

  def render_capital?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("capital")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_demonym?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("demonym")|| instance_options[:columns]=="all")
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
      if(instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_imagedepart?
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
