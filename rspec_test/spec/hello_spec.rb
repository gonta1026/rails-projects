require 'spec_helper'

RSpec.describe Hello do
  it "message return hello" do
    expect(Hello.new.message).to eq "hello"
  end
end


RSpec.describe '足し算' do
  it '1 + 1 は  2になること' do
    expect(1 + 1).to eq 2
  end
end