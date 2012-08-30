namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    users = {

      :levous => {
        :username => 'levous',
        :email => 'rusty@levo.us',
        :password => 'levois',
        :password_confirmation => 'levois'
      }

    }

    users.each do |item, hash|  
      user = User.new(hash)
      person = Person.new(:title => 'Rusty')
      user.person = person
      user.save!
    end


  end
end
