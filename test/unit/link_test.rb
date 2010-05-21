require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  fixtures :entries, :links

  def setup
    @entry = entries(:hase)
    @google = links(:google)
    @engadget = links(:engadget)
  end

  def test_should_be_parent_object
    assert_equal(1, @google.entry_id)
    assert_equal(1, @google.entry.id)
    assert_equal("hase", @google.entry.title)
  end



  def test_should_be_valid
    assert Link.new.valid?
  end
end

