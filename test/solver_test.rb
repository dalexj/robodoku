require_relative "test_helper"
require_relative "../lib/solver"

class SolverTest < Minitest::Test
  def test_it_solves_puzzle
    puzzle   = File.read("test/puzzle1.txt").strip
    solution = File.read("test/puzzle1_solution.txt").strip
    assert_equal solution, Solver.solve(puzzle)
  end

  def test_it_gets_square
    skip
    puzzle   = <<-PUZZLE
111222333
111222333
111222333
444555666
444555666
444555666
777888999
777888999
777888999
    PUZZLE
    assert_equal ["1"] * 9, Solver.new(puzzle).square_from(2, 2)
    assert_equal ["9"] * 9, Solver.new(puzzle).square_from(6, 8)
    assert_equal ["7"] * 9, Solver.new(puzzle).square_from(8, 1)
    assert_equal ["5"] * 9, Solver.new(puzzle).square_from(5, 5)
    assert_equal ["6"] * 9, Solver.new(puzzle).square_from(5, 8)
  end
end
