# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::System::Error do
  subject(:loader) { described_class.new }

  describe "#call" do
    let :proof do
      [
        Pennyworth::Models::System::Error[
          id: 1,
          name: "Errno::EPERM",
          description: "Operation not permitted"
        ],
        Pennyworth::Models::System::Error[
          id: 2,
          name: "Errno::ENOENT",
          description: "No such file or directory"
        ],
        Pennyworth::Models::System::Error[
          id: 3,
          name: "Errno::ESRCH",
          description: "No such process"
        ]
      ]
    end

    it "answers unique and sorted records" do
      expect(loader.call).to match(array_including(proof))
    end
  end
end
