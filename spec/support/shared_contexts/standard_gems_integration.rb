# frozen_string_literal: true

RSpec.shared_context "with Standard Gems integration" do
  let :standard_gems_record do
    {
      gem: "test",
      description: "A test gem.",
      sourceRepository: "https://github.com/ruby/test",
      versions: {
        "1.2": "1.2.3",
        "4.5": "4.5.6"
      }
    }
  end
end
