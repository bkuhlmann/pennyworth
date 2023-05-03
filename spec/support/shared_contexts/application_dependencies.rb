# frozen_string_literal: true

require "dry/container/stub"
require "infusible/stub"

RSpec.shared_context "with application dependencies" do
  using Infusible::Stub

  let :configuration do
    Etcher.new(Pennyworth::Container[:defaults])
          .call(git_hub_organization: "acme", git_hub_user: "test", ruby_gems_owner: "test")
          .bind(&:dup)
  end

  let(:kernel) { class_spy Kernel }
  let(:logger) { Cogger.new io: StringIO.new, formatter: :emoji }

  before { Pennyworth::Import.stub configuration:, kernel:, logger: }

  after { Pennyworth::Import.unstub :configuration, :kernel, :logger }
end
