namespace :nerdpilots do
  desc 'create account for users'
  task :create_accounts => :environment do

    User.where(np_account_created: false, cl_account_created: true).each do |user|
      next if user.cl_password.nil?
      service = NPilotsAccountService.new(user)
      service.execute
      if service.success?
        puts "SUCCESS: Create Nerdpilots account for user: #{user.email}"
      else
        puts "ERROR: #{service.error}"
      end
    end
  end
end
