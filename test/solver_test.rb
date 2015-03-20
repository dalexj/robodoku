require_relative "test_helper"
require_relative "../lib/solver"

class SolverTest < Minitest::Test
  def test_it_works
    assert Solver.new
  end
end
