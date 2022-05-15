# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::StandardError do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::StandardError[
      name: "ArgumentError",
      file_path: "/a/test/path/argument_error.rb",
      line_number: 20
    ]
  end

  describe "#id" do
    it "answers error name" do
      expect(presenter.id).to eq("ArgumentError")
    end
  end

  describe "#label" do
    it "answers error name" do
      expect(presenter.label).to eq("ArgumentError")
    end
  end

  describe "#path" do
    it "answers path and line number" do
      expect(presenter.path).to eq("/a/test/path/argument_error.rb:20")
    end

    it "answers only path when line number is missing" do
      record.line_number = nil
      expect(presenter.path).to eq("/a/test/path/argument_error.rb")
    end

    it "answers empty string if file path is nil" do
      record.file_path = nil
      expect(presenter.path).to eq("")
    end

    it "answers empty string if file path is empty" do
      record.file_path = ""
      expect(presenter.path).to eq("")
    end
  end
end
