AdminUser.find_or_create_by!(email: "admin@aiwrench.com") do |admin|
  admin.password = ENV.fetch("ADMIN_PASSWORD", "changeme123")
  admin.password_confirmation = ENV.fetch("ADMIN_PASSWORD", "changeme123")
  puts "Created admin user: admin@aiwrench.com"
end
