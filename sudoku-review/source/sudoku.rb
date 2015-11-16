# require 'pp'
class Sudoku

   def initialize(board_string)
        string = board_string.chars
        @board = []
        9.times do |index|
          @board << string.shift(9)
        end
         @board
      end

      def board
        9.times do |row|
          if row%3 ==  0
          print "+-----+-----+-----+\n"
          end
          9.times do |col|
            if col == 0
              print "|" + @board[row][col] +" "
            elsif col == 2 || col == 5
              print @board[row][col]+"|"
            elsif col == 8
              print @board[row][col]+"|\n"
            else
              print @board[row][col]+" "
            end
          end
        end
        print "+-----+-----+-----+\n"
      end



      def solve!
        while @board.flatten.include? "-"
          @board.each_with_index do |row,index_r|
            row.each_with_index do |col, index_c|
              if col == "-"

                #delete existing number in row from possible answers
                possible_answers = ("1".."9").to_a
                possible_answers -= row

                #delete existing number in col from possible answers
                check_col = []
                @board.each do |row|
                  check_col << row[index_c]
                end

                possible_answers -= check_col

                #delete exiting numbers in each grid from possible answers
                possible_answers -= each_grid(index_r,index_c)

                if possible_answers.length == 1
                  @board[index_r][index_c] = possible_answers[0]
                else
                  @board[index_r][index_c] = "-"
                end

              end
            end
          end
        end
         @board
      end

    # define each 3x3 grid
      def each_grid(index_r,index_c)
        top_left = find_top_left(index_r,index_c)
        array = []

        3.times do |x|
          3.times do |y|
            array << @board[top_left[0] + x, top_left[1] + y]
          end
        end
       array
      end

    # how to find top-left index of each grid
      def find_top_left(index_r, index_c)
        [(index_r / 3)*3, (index_c / 3)*3]
      end
    end

    # The file has newlines at the end of each line, so we call
