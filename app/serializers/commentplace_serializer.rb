class CommentplaceSerializer < ActiveModel::Serializer
      attribute :id, if: :render_id?
      attribute :content, if: :render_content?
      attribute :state, if: :render_state?
      belongs_to :user, if: :render_user?

      def render_id?
        if(instance_options[:columns].include?("id") || instance_options[:columns]=="all")
          return true
        else
          return false
        end
      end

      def render_content?
        if(instance_options[:columns].include?("content")|| instance_options[:columns]=="all")
          return true
        else
          return false
        end
      end

      def render_state?
        if(instance_options[:columns].include?("state")|| instance_options[:columns]=="all")
          return true
        else
          return false
        end
      end

      def render_user?
        if(instance_options[:columns].include?("user")|| instance_options[:columns]=="all")
          return true
        else
          return false
        end
      end
end
