require_relative 'chess'
require_relative 'node'
require_relative 'fake_queue'

module Chess
  class Knight
    KNIGHT_POSITION_DELTAS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]].freeze

    def initialize(coordinates)
      @from = Node.new(coordinates)
    end

    def move_to(target_position)
      queue = FakeQueue.new(@from)
      last_node = move_to_helper(target_position, queue)

      build_path(last_node)
    end

    private

    def build_path(last_node)
      path = []
      current_node = last_node

      while current_node
        path.unshift(current_node.coordinates)
        current_node = current_node.parent
      end

      path
    end

    def move_to_helper(target_position, queue)
      current_node = queue.remove
      return current_node if current_node.coordinates == target_position

      possibilities = KNIGHT_POSITION_DELTAS.map { |delta| possible_move(current_node.coordinates, delta) }.compact
      possibilities.each { |position| queue.add(Node.new(position, current_node)) }
      move_to_helper(target_position, queue)
    end

    def possible_move(position, delta)
      move_to = [position[0] + delta[0], position[1] + delta[1]]

      return nil if move_to[0] < MIN_INDEX || move_to[0] > MAX_INDEX
      return nil if move_to[1] < MIN_INDEX || move_to[1] > MAX_INDEX

      move_to
    end
  end
end
