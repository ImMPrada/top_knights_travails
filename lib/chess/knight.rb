require_relative 'chess'
require_relative 'step'
require_relative 'queue'

module Chess
  class Knight
    KNIGHT_POSITION_DELTAS = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]].freeze

    def initialize(coordinates)
      @current_step = Step.new(coordinates)
    end

    def move_to(target_position)
      steps_queue = Queue.new(@current_step)
      current_step = steps_queue.remove

      until current_step.coordinates == target_position
        possibilities = KNIGHT_POSITION_DELTAS.map { |delta| possible_move(current_step.coordinates, delta) }.compact
        possibilities.each { |position| steps_queue.add(Step.new(position, current_step)) }

        current_step = steps_queue.remove
      end

      build_path(current_step)
    end

    private

    def build_path(last_step)
      last_step.build_coordinates_path
    end

    def possible_move(position, delta)
      move_to = [position[0] + delta[0], position[1] + delta[1]]

      return nil if move_to[0] < MIN_INDEX || move_to[0] > MAX_INDEX
      return nil if move_to[1] < MIN_INDEX || move_to[1] > MAX_INDEX

      move_to
    end
  end
end
