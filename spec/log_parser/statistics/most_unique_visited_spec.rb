# frozen_string_literal: true

RSpec.describe LogParser::Statistics::MostUniqueVisited do
  subject { described_class }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }
  let(:processor) { LogParser::Processor.new(file_path) }
  let(:records) { LogParser::Analyzer.new(processor).send(:records) }
  let(:valid_outcome) do
    {
      '/index' => 23,
      '/home' => 23,
      '/contact' => 23,
      '/help_page/1' => 23,
      '/about/2' => 22,
      '/about' => 21
    }
  end

  describe '#gather_stats' do
    it 'provides valid statistics' do
      expect(subject.gather_stats(records)).to eql(valid_outcome)
    end
  end
end
