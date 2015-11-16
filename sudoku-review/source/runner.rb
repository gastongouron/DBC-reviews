require_relative 'sudoku'
require 'pp'
# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 16 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

def pick_random_line
  random_line = nil
  File.open("sudoku_puzzles.txt") do |file|
    file_lines = file.readlines()
    random_line = file_lines[Random.rand(0...file_lines.size())]
  end
  random_line
end

game = Sudoku.new(random_line)
pp game.solve!
game.board
