# frozen_string_literal: true

RSpec.shared_context "with GitHub integration" do
  let :git_hub_record do
    {
      name: "test",
      html_url: "https://github.com/bkuhlmann/test",
      description: "A test project.",
      homepage: "https://alchemists.io/projects/test"
    }
  end
end
