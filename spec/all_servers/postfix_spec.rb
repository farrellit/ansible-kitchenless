require 'spec_helper'

describe "each server" do
  it "runs postfix locally" do
    expect(port 25).to be_listening.on('127.0.0.1').with('tcp')
  end
end
