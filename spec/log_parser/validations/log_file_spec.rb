# frozen_string_literal: true

RSpec.describe LogParser::Validations::LogFile do
  subject(:for_epmty_file) { described_class.new(empty_file_path) }
  subject(:for_valid_file) { described_class.new(file_path) }
  subject(:for_invalid_path) { described_class.new('invalid_path') }
  let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }
  let(:empty_file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'empty.log') }

  describe '#validate_file!' do
    context 'when file is empty' do
      it 'raises correct error' do
        expect { for_epmty_file.validate_file! }.to raise_error(LogParser::EmptyFileError)
      end
    end

    context 'when path is invalid' do
      it 'raises correct error' do
        expect { for_invalid_path.validate_file! }.to raise_error(LogParser::NoFileError)
      end
    end

    context 'when file is valid' do
      it 'does not raise an error' do
        expect { for_valid_file.validate_file! }.not_to raise_error
      end
    end
  end
end
