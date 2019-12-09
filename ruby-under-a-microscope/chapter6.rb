# frozen_string_literal: true

require "minitest/autorun"

module A
  def self.included(*)
    puts "included A"
  end

  def self.prepended(*)
    puts "prepended A"
  end

  def call
    :a
  end
end

module B
  def self.included(*)
    puts "included B"
  end

  def self.prepended(*)
    puts "prepended B"
  end

  def call
    :b
  end
end

class Foo
  include A
  prepend B

  def call; :foo end
end

# class Bar
#   include A
#   include B
# end
#
# class Baz
#   include B
#   include A
# end
#
class Boo
  prepend A
  prepend B
end

class Boz
  extend A
end

describe Foo do
  it "returns :b" do
    _(Foo.ancestors[0..2]).must_equal [B, Foo, A]
    _(Foo.new.call).must_equal :b
  end
end

describe Boo do
  it "returns B, A, Boo as its ancestors" do
    _(Boo.ancestors[0..2]).must_equal [B, A, Boo]
  end
end

describe Boz do
  it "creates a class method that returns :a" do
    _(Boz.call).must_equal :a
  end
end
