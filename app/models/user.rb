class User < ActiveRecord::Base
  
  def self.from_omniauth(auth)

    where(auth.slice('provider', 'uid')). first || create_from_omniauth(auth)

  end

  def self.create_from_omniauth(auth)

    create! do |user|

      user.provider = auth['provider']

      user.uid = auth['uid']

      user.name = auth['info']['name']

      user.image = auth['info']['image']

      user.location = auth['info']['location']

    end

  end

end