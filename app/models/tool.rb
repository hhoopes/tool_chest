require 'active_support'

class Tool < ActiveRecord::Base    # ~> NameError: uninitialized constant ActiveRecord
  validates :name, presence: true

  def formatted_price
    price/100.0
  end

 #  def self.decode
 #    message = CGI.unescape("K0FXMTRmVHFKa3dRdkNDVFgzNGpYRHVNWDNuSkFQSnVxbHVveGNKZ01sVUlMaGVVbkJQYkFGTnYrK0NGVTVTaVk1MkExSlRuN0VLTXdPQWp4S2RpSkpjV0IxdzdRaHdRQmFwVy9VeCtyRzlQYkVPblFNeExoNFZJRGVkMlhSQ2c1dVpQWkZOcTZVRC9JbzRaTXhtSTVvMmIzcWVJQXZsMFRGTGZPWVp0c2plN2ZiclM4VFFvUUNGdGxPTjVhNmlNLS1UeWcvbU01Z3BUVDM5dTZwdGJXZ2l3PT0%3D--85ee57e711058f5098e87d5f7dae0909814f36b7")
 #
 #    # config = Rails.application.config
 #    key_iter_num = 1000
 # key_size     = 64
 # key = "550bc5051897ee9f97b38886ccbd6e5fa419f3ef7fbc211d164214e0c3d51215a5a93dcde4fd4e233b4f93519e257e8a9f7e829c3b0afcc6361e3f4e98ba2ea0"
 # salt         = "encrypted cookie"
 # signed_salt  = "signed encrypted cookie"
 #
 #    key_generator = ActiveSupport::KeyGenerator.new(
 #    key, iterations: 1000
 #    )
 #
 #    secret = key_generator.generate_key(
 #      salt
 #    )
 #
 #    sign_secret = key_generator.generate_key(
 #      signed_salt
 #    )

    # decryptor = ActiveSupport::MessageEncryptor.new(
    #   secret, sign_secret
    # )

    # decryptor.decrypt_and_verify(message)
  # end
end

# ~> NameError
# ~> uninitialized constant ActiveRecord
# ~>
# ~> /Users/heidi/Dropbox/Turing/2module/assignments/tool_chest/app/models/tool.rb:3:in `<main>'
