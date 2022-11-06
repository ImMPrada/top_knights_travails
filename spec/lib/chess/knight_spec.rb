require './spec/spec_helper'

RSpec.describe Chess::Knight do
  let(:starting_position) { [0, 0] }
  let(:knight) { described_class.new(starting_position) }

  describe '#move_to' do
    let(:target_position) { [3, 3] }
    let(:expected_path) { [[0, 0], [1, 2], [3, 3]] }

    it 'returns the path to the target position' do
      expect(knight.move_to(target_position)).to eq(expected_path)
    end

    it 'returns an array' do
      expect(knight.move_to(target_position)).to be_a(Array)
    end
  end
end
