# frozen_string_literal: true

RSpec.describe LogParser::Runner do
  subject { described_class.new(file_path) }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

  describe '#initialize' do
    it 'has a file_path variable' do
      expect(subject.instance_variable_get(:@file_path)).to be_equal(file_path)
    end
  end
end
