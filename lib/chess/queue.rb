module Chess
  class Queue
    attr_reader :steps

    def initialize(first_step = nil)
      @steps = [first_step].compact
    end

    def add(value)
      @steps << value
    end

    def remove
      return nil if @steps.empty?

      removed_value = @steps[0]
      @steps = @steps[1..]

      removed_value
    end

    def empty?
      steps.empty?
    end

    def size
      steps.size
    end
  end
end
