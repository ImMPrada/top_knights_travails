require_relative 'chess'
require_relative 'node'
require_relative 'fake_queue'

module Chess
  class Knight
    @@next_move_adds = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    def initialize(coordinates)
      @from = Node.new(coordinates)
    end
  end
end
