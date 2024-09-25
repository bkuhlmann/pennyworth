# frozen_string_literal: true

require "spec_helper"

RSpec.describe Pennyworth::Loaders::HTMX do
  subject(:scrapper) { described_class.new }

  include_context "with application dependencies"

  describe "#text_for" do
    it "answers text" do
      element = Ox::Element.new "td"
      element << "issues a "
      element << (Ox::Element.new("code") << "GET")
      element << " to specified URL"

      expect(described_class.text_for(element)).to eq("Issues a `GET` to specified URL")
    end

    it "answers empty string when empty" do
      expect(described_class.text_for([])).to eq("")
    end
  end

  describe "#call" do
    let :references do
      [
        Pennyworth::Models::HTMX[
          label: "hx-get",
          description: "Issues a `GET` to the specified URL.",
          uri: "https://htmx.org/attributes/hx-get/"
        ],
        Pennyworth::Models::HTMX[
          label: "hx-boost",
          description: "Add `progressive enhancement` for links and forms.",
          uri: "https://htmx.org/attributes/hx-boost/"
        ],
        Pennyworth::Models::HTMX[
          label: "htmx-added",
          description: "Applied to a new piece of content before it is swapped, " \
                       "removed after it is settled.",
          uri: "https://htmx.org/reference"
        ],
        Pennyworth::Models::HTMX[
          label: "HX-Boosted",
          description: "Indicates that the request is via an element using `hx-boost`.",
          uri: "https://htmx.org/reference"
        ],
        Pennyworth::Models::HTMX[
          label: "HX-Location",
          description: "Allows you to do a client-side redirect that does not do a full " \
                       "page reload.",
          uri: "https://htmx.org/headers/hx-location/"
        ],
        Pennyworth::Models::HTMX[
          label: "htmx:abort",
          description: "Send this event to an element to abort a request.",
          uri: "https://htmx.org/events/#htmx:abort"
        ],
        Pennyworth::Models::HTMX[
          label: "htmx.addClass()",
          description: "Adds a class to the given element.",
          uri: "https://htmx.org/api/#addClass"
        ],
        Pennyworth::Models::HTMX[
          label: "htmx.config.historyEnabled",
          description: "Defaults to `true`, really only useful for testing.",
          uri: "https://htmx.org/reference"
        ]
      ]
    end

    let :examples do
      [
        Pennyworth::Models::HTMX[
          label: "Click To Edit",
          description: "Demonstrates inline editing of a data object.",
          uri: "https://htmx.org/examples/click-to-edit/"
        ],
        Pennyworth::Models::HTMX[
          label: "Bulk Update",
          description: "Demonstrates bulk updating of multiple rows of data.",
          uri: "https://htmx.org/examples/bulk-update/"
        ],
        Pennyworth::Models::HTMX[
          label: "Click To Load",
          description: "Demonstrates clicking to load more rows in a table.",
          uri: "https://htmx.org/examples/click-to-load/"
        ]
      ]
    end

    it "answers references" do
      expect(scrapper.call(settings.htmx_references_uri)).to match(array_including(references))
    end

    it "answers examples" do
      expect(scrapper.call(settings.htmx_examples_uri)).to match(array_including(examples))
    end

    it "answers empty array with invalid status" do
      expect(scrapper.call("https://httpstat.us/500")).to eq([])
    end
  end
end
