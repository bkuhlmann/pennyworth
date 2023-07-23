# frozen_string_literal: true

RSpec.shared_context "with Standard Gems integration" do
  let :standard_gems_record do
    {
      gem: "test",
      description: "A test gem.",
      sourceRepository: "https://github.com/ruby/test",
      versions: {
        "3.3": "1.2.3",
        "3.2": "4.5.6"
      }
    }
  end
end
