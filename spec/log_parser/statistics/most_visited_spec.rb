# frozen_string_literal: true

RSpec.describe LogParser::Statistics::MostVisited do
  subject { described_class }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }
  let(:processor) { LogParser::Processor.new(file_path) }
  let(:records) { LogParser::Analyzer.new(processor).send(:records) }
  let(:valid_outcome) do
    {
      '/about/2' => 90,
      '/contact' => 89,
      '/index' => 82,
      '/about' => 81,
      '/help_page/1' => 80,
      '/home' => 78
    }
  end

  describe '#gather_stats' do
    it 'provides valid statistics' do
      expect(subject.gather_stats(records)).to eql(valid_outcome)
    end
  end
end
