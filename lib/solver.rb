class Solver
  def initialize(puzzle)
    @puzzle = puzzle
  end

  def solve
    parsed_puzzle
  end

  def parsed_puzzle
    @parsed_puzzle ||= @puzzle.split("\n").map(&:chars)
  end

  def square_from(x, y)
    parsed_puzzle[(x/3)*3, 3].flat_map { |line| line[(y/3)*3, 3] }
  end
end
