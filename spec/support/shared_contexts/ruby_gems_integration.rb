# frozen_string_literal: true

RSpec.shared_context "with RubyGems integration" do
  let :ruby_gems_record do
    {
      name: "test",
      version: "0.1.0",
      version_created_at: "2021-05-20T09:10:15.123Z",
      licenses: %w[MIT],
      downloads: 1_000,
      homepage_uri: "https://site.example.com",
      changelog_uri: "https://changes.example.com",
      source_code_uri: "https://source.example.com",
      bug_tracker_uri: "https://issues.example.com"
    }
  end
end
