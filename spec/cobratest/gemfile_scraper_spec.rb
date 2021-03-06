require 'spec_helper'

describe Cbratest::GemfileScraper do
  it "'s name is the last part of the given path" do
    expect(described_class.new("some/path_with/a/special_name").name).to eq "special_name"
  end

  describe "#transitive_cobra_dependencies" do
    it "returns an array of hashes of the all (transitive) cobra_dependencies" do
      start_path = File.expand_path(File.join(__FILE__, "..", "..", "..", "spec", "examples", "letters", "D"))
      expected_base_path = File.expand_path(File.join(__FILE__, "..", "..", "..", "spec", "examples", "letters"))

      scraper = described_class.new(start_path)
      expect(scraper.transitive_cobra_dependencies).to eq([
        {:name => "E1",
          :options => {
            :path => File.join(expected_base_path, "E1")
          }
        },
        {:name => "E2",
          :options => {
            :path => File.join(expected_base_path, "E2")
          }
        },
        {:name => "F",
          :options => {
            :path => File.join(expected_base_path, "F")
          }
        }
      ])
    end
  end
end
