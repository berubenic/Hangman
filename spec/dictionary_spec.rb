require './lib/dictionary'

describe Dictionary do
  describe '#load_dictionary' do
    subject(:dictionary) { described_class.new }
    let(:file_like_object) { double('file like object') }

    it 'Opens the 5desk.txt file and assigns it to @dictionary' do
      allow(File).to receive(:open).with('5desk.txt').and_return(file_like_object)
      dictionary.load_dictionary
      variable = dictionary.instance_variable_get(:@dictionary)
      expect(variable).to eq(file_like_object)
    end
  end

  describe '#read_dictionary' do
    subject(:dictionary) { described_class.new }
    before do
      dictionary.load_dictionary
    end

    it 'assigns file content to @dictionary' do
      dictionary.read_dictionary
      variable = dictionary.instance_variable_get(:@dictionary)
      expect(variable).not_to be_a(File)
    end

    it 'is an Array' do
      dictionary.read_dictionary
      variable = dictionary.instance_variable_get(:@dictionary)
      expect(variable).to be_a(Array)
    end
  end

  describe '#keep_5_to_12_words' do
    subject(:dictionary) { described_class.new }

    before do
      dictionary.load_dictionary
      dictionary.read_dictionary
      dictionary.keep_5_to_12_words
    end

    it 'has no elements longer than 12 characters' do
      expect(dictionary.possible_words.sample.length).to be <= 12
    end

    it 'has no elements shorter than 5 characters' do
      expect(dictionary.possible_words.sample.length).to be >= 5
    end
  end
end
