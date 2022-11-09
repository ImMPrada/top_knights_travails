module Chess
  class Step
    attr_reader :coordinates, :previous_step

    def initialize(coordinates, previous_step = nil)
      @previous_step = previous_step
      @coordinates = coordinates
    end

    def build_coordinates_path
      path = []
      current_step = self

      while current_step
        path.unshift(current_step.coordinates)
        current_step = current_step.previous_step
      end

      path
    end
  end
end
