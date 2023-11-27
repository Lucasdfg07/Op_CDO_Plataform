file_path = Rails.root.join('db', 'seeds', 'op_cdo_users.txt')
emails = File.readlines(file_path).map(&:strip).reject(&:empty?)

emails.each do |email|
  User.create(email: email, password: ENV['DEFAULT_PASSWORD']) unless User.exists?(email: email)
end
