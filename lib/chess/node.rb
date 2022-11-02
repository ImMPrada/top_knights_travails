require_relative 'chess'
require 'byebug'

module Chess
  class Node
    attr_reader :coordinates, :parent

    def initialize(coordinates, parent = nil)
      @parent = parent
      @coordinates = coordinates
    end
  end
end
