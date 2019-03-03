class User < ApplicationRecord
  # #2
   before_save { self.email = email.downcase if email.present? }
   has_many :posts, dependent: :destroy
  # before_save {
  #      name_array = []
  #      name.to_s.split.each do |part|
    #        name_array << part.capitalize
    #    end
    #    self.name = name_array.join(" ")
    #}

 # #3
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #4
  validates :password, presence: true, length: { minimum: 6 }, if: -> {password_digest.nil?}
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #5
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

 # #6
   has_secure_password
end