require 'bcrypt'

class User

attr_reader :password
attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id,    Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password, as: :email_address

end
