require_relative "board"

class Solver
  def self.solve(input)
    Board.solve(input)
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
