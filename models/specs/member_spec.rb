require("minitest/autorun")
require("minitest/rg")
require_relative("../member.rb")

class MemberTest < MiniTest::Test

  def setup()
    @member1 = Member.new({"first_name" => "John", "last_name" => "Smith", "date_of_birth" => "5/10/1995"})
    @member2 = Member.new({"first_name" => "Sarah", "last_name" => "Docherty", "date_of_birth" => "4/9/1994"})
  end

  def test_set_first_name()
    @member1.set_first_name("Jim")
    assert_equal("Jim", @member1.first_name())
  end

  def test_set_last_name()
    @member1.set_last_name("Brown")
    assert_equal("Brown", @member1.last_name())
  end

  def test_set_date_of_birth()
    @member1.set_date_of_birth("15/10/1995")
    assert_equal("15/10/1995", @member1.date_of_birth())
  end

end
