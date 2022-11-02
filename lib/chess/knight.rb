require_relative 'chess'
require_relative 'node'
require_relative 'fake_queue'

module Chess
  class Knight
    @@next_move_adds = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    def initialize(coordinates)
      @from = Node.new(coordinates)
    end

    private

    def possible_move(position, delta)
      move_to = [position[0] + delta[0], position[1] + delta[1]]

      return nil if move_to[0] < MIN_INDEX || move_to[0] > MAX_INDEX
      return nil if move_to[1] < MIN_INDEX || move_to[1] > MAX_INDEX

      move_to
    end
  end
end
