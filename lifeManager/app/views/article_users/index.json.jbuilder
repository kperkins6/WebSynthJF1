json.array!(@article_users) do |article_user|
  json.extract! article_user, :id, :article_id, :user_id
  json.url article_user_url(article_user, format: :json)
end
