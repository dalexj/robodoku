class Solver
  def initialize(puzzle)
    @puzzle = puzzle
  end

  def solve
    fill_in_spots_with_one_possible_number
    parsed_puzzle.map(&:join).join("\n")
  end

  def parsed_puzzle
    @parsed_puzzle ||= @puzzle.split("\n").map(&:chars)
  end

  def square_from(x, y)
    parsed_puzzle[(x/3)*3, 3].flat_map { |line| line[(y/3)*3, 3] }
  end

  def col_from(x)
    parsed_puzzle[x]
  end

  def row_from(y)
    parsed_puzzle.transpose[y]
  end

  def squares_related(x, y)
    (row_from(y) + col_from(x) + square_from(x, y)).uniq
  end

  def possibilities_from(x, y)
    ("1".."9").to_a - squares_related(x, y)
  end

  def fill_in_spots_with_one_possible_number
    changed = true
    a = 0
    while changed && a < 100
      a += 1
      changed = false
      81.times do |num|
        x, y = num.divmod(9)
        possibilities = possibilities_from(x, y)
        if parsed_puzzle[x][y] == "0" && possibilities.length == 1
          parsed_puzzle[x][y] = possibilities.first
          changed = true
        end
      end
    end
  end

  def printer
    board_string_thingy = <<-BOARD
╔═══════════╦═══════════╦═══════════╗
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
╠═══════════╬═══════════╬═══════════╣
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
╠═══════════╬═══════════╬═══════════╣
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
║           ║           ║           ║
║ 0   0   0 ║ 0   0   0 ║ 0   0   0 ║
╚═══════════╩═══════════╩═══════════╝
    BOARD
    board_string_thingy.gsub!("0").with_index do |spot, index|
      parsed_puzzle.flatten[index]
    end
    puts board_string_thingy
  end
end
