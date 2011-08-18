require 'test/unit'
require_relative 'churn'

class ChurnTests < Test::Unit::TestCase

  def test_month_before_is_28_days
    assert_equal(Time.local(2005, 1, 1),
                 month_before(Time.local(2005, 1, 29)))
  end

  def test_header_format
    head = header(svn_date(month_before(Time.now)))
    assert_equal("Changes between 2011-07-22 and 2011-08-19:", head)
  end

  def test_normal_subsystem_line_format
    assert_equal('audit          (45 changes)   *********',
                 subsystem_line("audit", 45))
  end

  def test_no_changes_subsystem_line_format
    assert_equal('persistence    -              -',
                 subsystem_line("persistence", 0))
  end

  def test_asterisks_for_divide_by_five
    assert_equal('****', asterisks_for(20))
  end

  def test_asterisks_for_rounds_up_and_down
    assert_equal('****', asterisks_for(18))
    assert_equal('***', asterisks_for(17))
    assert_equal('*', asterisks_for(1))
    assert_equal('*', asterisks_for(2))
  end

  def test_subversion_log_can_have_no_changes
    assert_equal(0, extract_change_count_from("------------------------------------------------------------------------\n"))
  end

  def test_subversion_log_with_changes
    assert_equal(2, extract_change_count_from("------------------------------------------------------------------------
r2 | marick | 2005-08-07 14:26:21 -0500 (Mon, 07 Aug 2005) | 1 line

added code to handle merger
------------------------------------------------------------------------
r1 | marick | 2005-08-07 14:21:47 -0500 (Mon, 07 Aug 2005) | 1 line

first touches
No commit for revision 0.
------------------------------------------------------------------------\n"))
  end

  def test_svn_date
    assert_equal('2005-03-04', svn_date(Time.local(2005, 3, 4)))
  end

end
