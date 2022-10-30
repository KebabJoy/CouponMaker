require 'csv'

namespace :generate do
  task promos: :environment do
    begin
      (2..3).each do |i|
        csv = CSV.read("#{i}.csv")
        csv.flatten!.map! { |pin| { pin: pin, expiration_date: 1.year.from_now, uses_left: 3, created_at: Time.zone.now, updated_at: Time.zone.now } }
        pp "Smh #{i}"
        Coupon.insert_all!(csv)
      end
    end
  end
end
