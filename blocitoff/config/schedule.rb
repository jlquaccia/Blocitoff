every :day, :at => '11:58 am' do
  rake "todo:delete_items", :environment => 'development' 
end