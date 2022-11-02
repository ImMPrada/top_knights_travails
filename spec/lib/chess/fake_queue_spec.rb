require './spec/spec_helper'

RSpec.describe Chess::FakeQueue do
  let(:empty_queue) { described_class.new }
  let(:queue) { described_class.new(1) }

  describe '#initialize' do
    describe 'when the queue is empty' do
      it 'sets the data to an empty array' do
        expect(empty_queue.data).to eq([])
      end
    end

    describe 'when the queue has data' do
      it 'sets the data' do
        expect(queue.data).to eq([1])
      end
    end
  end

  describe '#size' do
    it 'returns the size of the data' do
      expect(queue.size).to eq(1)
    end
  end

  describe '#empty?' do
    describe 'when the queue is empty' do
      it 'returns true' do
        expect(empty_queue.empty?).to be true
      end
    end

    describe 'when the queue has data' do
      it 'returns false' do
        expect(queue.empty?).to be false
      end
    end
  end

  describe '#add' do
    let(:expected_data) { [1, 2] }

    before { queue.add(2) }

    it 'adds the value to the @data of the queue' do
      expect(queue.data).to eq(expected_data)
    end

    it 'updates the size of the queue' do
      expect(queue.size).to eq(2)
    end
  end

  describe '#remove' do
    describe 'when the queue is empty' do
      it 'returns nil' do
        expect(empty_queue.remove).to be_nil
      end
    end

    describe 'when the queue has data' do
      let(:expected_data) { [2] }

      before { queue.add(2) }

      it 'removes the first value from the queue' do
        expect(queue.remove).to eq(1)
      end

      it 'updates the data of the queue' do
        queue.remove

        expect(queue.data).to eq(expected_data)
      end

      it 'updates the size of the queue' do
        queue.remove

        expect(queue.size).to eq(1)
      end
    end
  end
end
