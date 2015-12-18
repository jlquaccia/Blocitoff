namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    # puts Item.where("created_at <= ?", Time.now - 7.days).inspect
    # puts Item.first
    # puts Item.count
  end
end