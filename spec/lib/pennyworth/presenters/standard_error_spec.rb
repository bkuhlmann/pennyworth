# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Presenters::StandardError do
  subject(:presenter) { described_class.new record }

  let :record do
    Pennyworth::Models::StandardError[
      name: "ArgumentError",
      file_path: "/an/argument_error.rb",
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
      expect(presenter.path).to eq("/an/argument_error.rb:20")
    end

    context "without line number" do
      let :record do
        Pennyworth::Models::StandardError[name: "ArgumentError", file_path: "/an/argument_error.rb"]
      end

      it "answers path only" do
        expect(presenter.path).to eq("/an/argument_error.rb")
      end
    end

    context "without file path or line number" do
      let(:record) { Pennyworth::Models::StandardError[name: "ArgumentError"] }

      it "answers empty string if file path is nil" do
        expect(presenter.path).to eq("")
      end
    end

    context "with blank file path and no line number" do
      let(:record) { Pennyworth::Models::StandardError[name: "ArgumentError", file_path: ""] }

      it "answers empty string if file path is nil" do
        expect(presenter.path).to eq("")
      end
    end
  end
end
