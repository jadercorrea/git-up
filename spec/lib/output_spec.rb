require 'output'

module Gitup
  describe Output do
    let(:message) { "$ git up install-man\n" }

    subject { described_class.new }

    describe '.puts' do
      it 'prints a message on console' do
        expect { subject.puts(message) }.to output(message).to_stdout
      end
    end

    describe '.log' do
      context 'when a message is not informed' do
        it 'prints all stored messages on console' do
          log = "$ git up --version\n"\
            "$ git up --help\n"
          subject.puts('$ git up --version')
          subject.puts('$ git up --help')

          expect { subject.log }.to output(log).to_stdout
        end
      end

      context 'when a message is informed' do
        it 'prints the message on console' do
          message = "git add\n"\
            "git commit --ammend\n"

          expect { subject.log(message) }.to output(message).to_stdout
        end
      end
    end
  end
end
