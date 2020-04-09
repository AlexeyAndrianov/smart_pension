# frozen_string_literal: true

RSpec.describe LogParser::Runner do
  subject { described_class.new(file_path) }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }
  let(:valid_output) do
    <<-OUTPUT
      Most visited:
      /about/2 90 visits
      /contact 89 visits
      /index 82 visits
      /about 81 visits
      /help_page/1 80 visits
      /home 78 visits



      Most Unique visited:
      /index 23 unique visits
      /home 23 unique visits
      /contact 23 unique visits
      /help_page/1 23 unique visits
      /about/2 22 unique visits
      /about 21 unique visits
    OUTPUT
  end
  let(:correct_output) do
    valid_output.gsub(/^#{valid_output.scan(/^[ \t]+(?=\S)/).min}/, '')
  end

  describe '#initialize' do
    it 'has a file_path variable' do
      expect(subject.instance_variable_get(:@file_path)).to be_equal(file_path)
    end
  end

  describe '#perform_analytics' do
    it 'parses log and outputs statistics' do
      expect { subject.perform_analytics }.to output(correct_output).to_stdout
    end
  end
end
