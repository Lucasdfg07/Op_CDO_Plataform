file_path = Rails.root.join('db', 'seeds', 'op_cdo_users.txt')
emails = File.readlines(file_path).map(&:strip).reject(&:empty?)

password = '2024NAGRINGA'

emails.each do |email|
  User.create(email: email, password: password, password_confirmation: password) unless User.exists?(email: email)
end
