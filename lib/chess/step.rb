module Chess
  class Step
    attr_reader :coordinates, :previous_step

    def initialize(coordinates, previous_step = nil)
      @previous_step = previous_step
      @coordinates = coordinates
    end
  end
end
