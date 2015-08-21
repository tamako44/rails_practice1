class Group < ActiveRecord::Base
    validates :title, presence: true  # 驗證 title 不可空白
    
    has_many :posts
    
    belongs_to :owner, class_name: "User", foreign_key: :user_id
    
    def editable_by?(user)
        user && user == owner
    end
end
