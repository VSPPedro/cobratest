require 'spec_helper'

describe Cbratest::TestsToRunSelector do
  describe '#list' do
    it 'includes a test runner if a component is marked as changed' do
      expect(Cbratest::TestsToRunSelector.new.list(
                 {{:name => "name", :options => {:path => "/some/path"}} => true}
             )).to eq (
                          ["/some/path/test.sh"]
                      )
    end

    it 'does not include a test runner if a component is marked as not changed' do
      expect(Cbratest::TestsToRunSelector.new.list(
                 {{:name => "name", :options => {:path => "/some/path"}} => false}
             )).to eq (
                          []
                      )
    end
  end
end