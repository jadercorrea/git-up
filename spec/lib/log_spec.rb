require "log"

module Gitup
  describe Log do
    subject { described_class.new }

    describe '.push' do
      it 'saves a log message' do
        message = '$ git up install-man'
        expect(subject.push(message)).to eq message
      end
    end

    describe ".stack" do
      it 'prints all stored messages on console' do
        message1 = '$ git up --version'
        message2 = '$ git up --help'
        subject.push(message1)
        subject.push(message2)

        expect(subject.stack).to eq [message1,
                                        message2]
      end
    end
  end
end
