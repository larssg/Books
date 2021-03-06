require File.dirname(__FILE__) + '/../test_helper'

class LoanTest < ActiveSupport::TestCase
  context "Borrowing a book" do
    setup do
      Loan.delete_all # clear out loans in the database
      @user = Factory.create_user('mike')
      @book = Factory.create_book('A book')
      @loan = @book.loans.create(:user => @user)
    end
    
    should "be the current_loan on a book" do
      assert_equal @book.current_loan, @loan
    end
      
    should "be the only active loan on a book" do
      assert_equal @book.loans.active.size, 1
      assert_equal @book.loans.active.first, @loan
    end
    
    context "when a loan already exists" do
      setup do
        @new_user = Factory.create_user('mikey')
        @new_loan = @book.loans.create(:user => @new_user)
      end
    
      should "be the current_loan on a book" do
        assert_equal @book.current_loan, @new_loan
      end
      
      should "be the only active loan on a book" do
        assert_equal @book.loans.active.size, 1
        assert_equal @book.loans.active.first, @new_loan
      end
      
      should "return the old loan" do
        @loan.reload
        assert @loan.returned?
      end
    end
  end
end
