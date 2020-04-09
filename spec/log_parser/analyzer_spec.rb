# frozen_string_literal: true

RSpec.describe LogParser::Analyzer do
  subject { described_class.new(processor) }
  let(:processor) { LogParser::Processor.new(file_path) }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }
  let(:correct_result) do
    {
      most_visited:
        {
          '/about/2' => 90,
          '/contact' => 89,
          '/index' => 82,
          '/about' => 81,
          '/help_page/1' => 80,
          '/home' => 78
        },
      most_unique_visited:
        {
          '/index' => 23,
          '/home' => 23,
          '/contact' => 23,
          '/help_page/1' => 23,
          '/about/2' => 22,
          '/about' => 21
        }
    }
  end

  describe 'perform' do
    it 'analyzes data and provides correct statistics' do
      expect(subject.perform).to be_eql(correct_result)
    end
  end
end
