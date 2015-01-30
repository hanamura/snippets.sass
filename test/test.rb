require 'minitest/unit'
require 'minitest/autorun'
require 'sass'

class TestMixins < MiniTest::Unit::TestCase
  def render(sass)
    engine = Sass::Engine.new sass, {
      :style => :compressed,
      :syntax => :sass,
      :load_paths => [File.dirname(__FILE__)],
    }
    engine.render
  end

  def test_mixins
    [
      'selector-index-append',
      'selector-index-replace',
    ].each do |name|
      target_path = File.expand_path "#{name}-target.sass", File.dirname(__FILE__)
      expect_path = File.expand_path "#{name}-expect.sass", File.dirname(__FILE__)
      target_css = render File.read target_path
      expect_css = render File.read expect_path
      assert_equal target_css, expect_css
    end
  end
end
