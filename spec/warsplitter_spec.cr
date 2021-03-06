require "./spec_helper"

describe War do
  it "should raise with no input" do
    input = ""
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with blank input" do
    input = " "
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with no vs" do
    input = "dogs"
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with no second option" do
    input = "dogs vs"
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with blank second option" do
    input = "dogs vs "
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with no context" do
    input = "dogs vs cats ;"
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should raise with blank context" do
    input = "dogs vs cats ; "
    expect_raises(Warsplitter::SyntaxError) do
      w = War.new(input)
    end
  end

  it "should split stuff" do
    input = "dogs vs cats"
    w = War.new(input)
    w.first_option.should eq("dogs")
    w.second_option.should eq("cats")
    w.context.should eq("")
  end

  it "should split stuff with context" do
    input = "dogs vs cats ; in the context of who is the snuggliest"
    w = War.new(input)
    w.first_option.should eq("dogs")
    w.second_option.should eq("cats")
    w.context.should eq("in the context of who is the snuggliest")
  end
end
