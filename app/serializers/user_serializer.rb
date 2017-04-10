class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_lastname, :user_email, :user_gender, :user_birthdate, :token, :created_at, :user_active
  link(:self) { user_url(object) }
end
