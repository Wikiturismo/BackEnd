class TownSerializer < ActiveModel::Serializer
  attribute :id, if: :render_id?
  attribute :name, if: :render_name?
  attribute :airport, if: :render_airport?
  attribute :transpterminal, if: :render_transpterminal?
  attribute :weather, if: :render_weather?
  attribute :demonym, if: :render_demonym?
  attribute :avertemper, if: :render_avertemper?
  attribute :altitude, if: :render_altitude?
  has_many :places, if: :render_hasmany?
  has_many :imagetowns, if: :render_hasmany?
  has_many :commenttowns, if: :render_hasmany?
  belongs_to :depart, if: :render_depart?

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

  def render_airport?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("airport")|| instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_transpterminal?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("transpterminal") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_weather?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("weather")|| instance_options[:columns]=="all")
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

  def render_avertemper?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("avertemper") || instance_options[:columns]=="all")
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def render_altitude?
    if(instance_options[:columns])
      if(instance_options[:columns].include?("altitude") || instance_options[:columns]=="all")
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
