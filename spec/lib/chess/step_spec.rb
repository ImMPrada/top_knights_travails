require './spec/spec_helper'

RSpec.describe Chess::Step do
  let(:steps_array) { [[0, 0], [1, 2]] }
  let(:first_step) { described_class.new(steps_array[0]) }
  let(:second_step) { described_class.new(steps_array[1], first_step) }

  describe '#build_coordinates_path' do
    it 'returns the path to the target position' do
      expect(second_step.build_coordinates_path).to eq(steps_array)
    end

    it 'returns an array' do
      expect(second_step.build_coordinates_path).to be_a(Array)
    end
  end
end
