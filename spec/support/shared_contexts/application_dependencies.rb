# frozen_string_literal: true

RSpec.shared_context "with application dependencies" do
  using Refinements::Struct

  let(:settings) { Pennyworth::Container[:settings] }
  let(:kernel) { class_spy Kernel }
  let(:logger) { Cogger.new id: :pennyworth, io: StringIO.new }

  before do
    settings.merge! Etcher.call(
      Pennyworth::Container[:registry].remove_loader(1),
      git_hub_organization: "acme",
      git_hub_user: "test",
      ruby_gems_owner: "test"
    )

    Pennyworth::Container.stub! kernel:, logger:
  end

  after { Pennyworth::Container.restore }
end
