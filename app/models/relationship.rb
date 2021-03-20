class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'
end


# class_name: '' の中の文字列は､大文字から始める！！！