require 'help'

module Gitup
  describe Help do
    subject { described_class.new }

    before do
      %w(green yellow).each do |color|
        allow_any_instance_of(String).to receive_messages(color.to_sym)
      end
    end

    describe '#banner' do
      it 'returns a help text' do
        expect(subject.banner).to eq banner_message
      end

      def banner_message
        %(Fetch and rebase all remotely-tracked branches.

    $ git up
    master         #{'up to date'.green}
    development    #{'rebasing...'.yellow}
    staging        #{'fast-forwarding...'.yellow}
    production     #{'up to date'.green}

    $ git up --version    # print version info
    $ git up --help       # print this message

There are no interesting command-line options, but
there are a few `git config` variables you can set.
For info on those and more, check out the man page:

    $ git up man

Or install it to your system, so you can get to it with
`man git-up` or `git help up`:

    $ git up install-man)
      end
    end

    describe '#bundler_config_message' do
      it 'returns bundler config message' do
        expect(subject.bundler_config_message).to eq bundler_message
      end

      def bundler_message
        %(The GIT_UP_BUNDLER_CHECK environment variable is deprecated.
You can now tell git-up to check (or not check) for missing
gems on a per-project basis using git's config system. To
set it globally, run this command anywhere:

    git config --global git-up.bundler.check true

To set it within a project, run this command inside that
project's directory:

    git config git-up.bundler.check true

Replace 'true' with 'false' to disable checking.)
      end
    end
  end
end
