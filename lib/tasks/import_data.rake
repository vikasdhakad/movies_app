namespace :import do
  desc "Import movies and reviews from CSV files"
  task csv_data: :environment do
    require 'csv'
    batch_size = 2 # Change batch size with respect to requirement

    File.open(Rails.root.join('public', 'movies.csv')) do |file|
      headers = file.first
      file.lazy.each_slice(batch_size) do |lines|
        csv_rows = CSV.parse(lines.join, headers: false)
        csv_rows.each do |csv_row|
          begin
            Movie.create!(name: csv_row[0], description: csv_row[1],
            year: csv_row[2],director: csv_row[3], actor: csv_row[4],
            filming_location: csv_row[5], country: csv_row[6])
          rescue StandardError => e
            puts "ERROR: #{e.message}, CSV Data: #{csv_row}"
          end
        end
      end
    end

    File.open(Rails.root.join('public', 'reviews.csv')) do |file|
      headers = file.first
      file.lazy.each_slice(batch_size) do |lines|
        csv_rows = CSV.parse(lines.join, headers: false)
        csv_rows.each do |csv_row|
          begin
            movie = Movie.find_by_name(csv_row[0])
            user = User.find_by_name(csv_row[1])
            movie.reviews.create!(
              user_id: user.id, stars: csv_row[2], content: csv_row[3]
            )
          rescue StandardError => e
            puts "ERROR in reviews import: #{e.message}, CSV Data: #{csv_row}"
          end
        end
      end
    end
  end
end
