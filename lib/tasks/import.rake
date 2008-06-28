namespace :books do
  desc "Import books from CSV file"
  task :import => :environment do
    file = "#{RAILS_ROOT}/data/books.csv"
    FasterCSV.foreach(file, { :headers => :first_row }) do |row|
      book = Book.create(:isbn => row['ISBN'])
      if book.name.blank?
        book.name = row['Title'].strip
        book.pages = row['Pages'].strip

        release = row['Release'].strip
        unless release.blank?
          # Fix Danish month abbreviations
          release.gsub!(/okt/, 'oct')
          release.gsub!(/maj/, 'may')
          book.published = Date.parse(release) 
        end

        book.save

        row['Author'].split(",").each do |name|
          author = Author.find_or_create_by_name(name.strip)
          book.authors << author
        end
      end
      
      puts "Imported #{book.name}..."
    end
  end
end