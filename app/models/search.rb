class Search < ActiveRecord::Base
  def books
    @books ||= find_books
  end
  
  def authors
    @authors ||= find_authors
  end
  
  private
  def find_books
    Book.find(:all, :conditions => ["books.name LIKE ?", "%#{keywords}%"])
  end
  
  def find_authors
    Author.find(:all, :conditions => ["authors.name LIKE ?", "%#{keywords}%"])
  end
end