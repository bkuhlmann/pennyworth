# frozen_string_literal: true

RSpec.shared_context "with application dependencies" do
  let :configuration do
    Etcher.new(Pennyworth::Container[:defaults])
          .call(git_hub_organization: "acme", git_hub_user: "test", ruby_gems_owner: "test")
          .bind(&:dup)
  end

  let(:kernel) { class_spy Kernel }
  let(:logger) { Cogger.new id: :pennyworth, io: StringIO.new }

  before { Pennyworth::Container.stub! configuration:, kernel:, logger: }

  after { Pennyworth::Container.restore }
end
