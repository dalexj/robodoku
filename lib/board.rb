class Board
  def self.solve(raw_board)
    new(raw_board.split("\n").map(&:chars)).solve
  end

  def initialize(parsed_puzzle)
    @puzzle = parsed_puzzle
  end

  def fill_in_spots_with_one_possible_number
    changed = true
    a = 0
    while changed && a < 100
      a += 1
      changed = false
      81.times do |square_index|
        x, y = square_index.divmod(9)
        possibilities = possibilities_from(x, y)
        if @puzzle[x][y] == "0" && possibilities.length == 1
          @puzzle[x][y] = possibilities.first
          changed = true
        end
      end
    end
  end

  def possibilities_from(x, y)
    ("1".."9").to_a - squares_related(x, y)
  end

  def square_from(x, y)
    @puzzle[(x/3)*3, 3].flat_map { |line| line[(y/3)*3, 3] }
  end

  def col_from(x)
    @puzzle[x]
  end

  def row_from(y)
    @puzzle.transpose[y]
  end

  def squares_related(x, y)
    (row_from(y) + col_from(x) + square_from(x, y)).uniq
  end

  def solve
    fill_in_spots_with_one_possible_number
    @puzzle.map(&:join).join("\n")
  end
end
