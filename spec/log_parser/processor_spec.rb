# frozen_string_literal: true

RSpec.describe LogParser::Processor do
  subject { described_class.new(parsed_file) }
  let(:parsed_file) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

  describe '#read_from_file' do
    it 'reads from file and creates Record object for every line' do
      expect(subject.read_from_file.sample).to be_kind_of(LogParser::Record)
    end
  end
end
