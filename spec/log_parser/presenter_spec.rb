# frozen_string_literal: true

RSpec.describe LogParser::Presenter do
  subject { described_class.new(result) }
  let(:result) do
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
  let(:actual_result) do
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
    actual_result.gsub(/^#{actual_result.scan(/^[ \t]+(?=\S)/).min}/, '')
  end

  describe '#report' do
    it 'reports valid data to stdout' do
      expect { subject.report }.to output(correct_output).to_stdout
    end
  end
end
