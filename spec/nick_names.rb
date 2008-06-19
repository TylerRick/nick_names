require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + "/../lib/nick_names"

describe NickNames, 'nick_names_for' do
  it "should return bob as a nickname for robert" do
    NickNames.nick_names_for('robert').should include('bob')
  end
end

describe NickNames, 'equivalencies_for' do
  it "should return bob as an alternate for robert" do
    NickNames['robert'].should include('bob')
  end
  it "should return robert as an alternate for bob" do
    NickNames['bob'].should include('robert')
  end
  it "should be case insensitive" do
    NickNames['bOB'].should include('robert')
  end
  it "should return lots of alternates for bob" do
    NickNames['bob'].should eql(
      ["bill", "billy", "bob", "bobby", "rob", "robby", "robert"]
    )
  end
  it "should return itself -- even if it's not in our table" do
    NickNames['conzwega'].should include('conzwega')
  end
  it "and [] are aliases for each other" do
    NickNames['bob'].should eql(
      NickNames.equivalencies_for('bob')
    )
  end
end
