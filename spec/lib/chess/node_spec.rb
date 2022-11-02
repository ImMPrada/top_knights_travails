require './spec/spec_helper'

RSpec.describe Chess::Node do
  describe '#initialize' do
    let(:node) { described_class.new([1, 2]) }

    describe 'when the node has no parent' do
      it 'sets the coordinates' do
        expect(node.coordinates).to eq([1, 2])
      end

      it 'sets the parent to nil' do
        expect(node.parent).to be_nil
      end
    end

    describe 'when the node has a parent' do
      let(:children) { described_class.new([3, 4], node) }

      it 'sets the parent' do
        expect(children.parent).to eq(node)
      end
    end
  end
end
