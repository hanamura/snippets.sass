require 'minitest/unit'
require 'minitest/autorun'
require 'sass'

class TestSnippets < MiniTest::Unit::TestCase
  def render(sass)
    engine = Sass::Engine.new sass, {
      :style => :compressed,
      :syntax => :sass,
      :load_paths => [File.dirname(__FILE__)],
    }
    engine.render
  end

  def test_snippets
    [
      'selector-find-append',
      'selector-find-replace',
      'selector-index-append',
      'selector-index-replace',
      'str-replace-all',
    ].each do |name|
      target_path = File.expand_path "#{name}-target.sass", File.dirname(__FILE__)
      expect_path = File.expand_path "#{name}-expect.sass", File.dirname(__FILE__)
      target_css = render File.read target_path
      expect_css = render File.read expect_path
      assert_equal target_css, expect_css
    end
  end
end
