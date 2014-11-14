require 'spec_helper'

describe "each server" do
  it "runs sshd" do
    expect(port 22).to be_listening
    expect(service 'sshd').to be_running
  end
end
