# frozen_string_literal: true

RSpec.describe LogParser::Record do
  let(:endpoint) { '/contact' }
  let(:ip) { '444.701.448.104' }
  subject { described_class.new(endpoint, ip) }

  describe '#initialize' do
    it 'has a valid endpoint attribute' do
      expect(subject.instance_variable_get(:@endpoint)).to be_equal(endpoint)
    end

    it 'has a valid ip attribute' do
      expect(subject.instance_variable_get(:@ip)).to be_equal(ip)
    end
  end
end
