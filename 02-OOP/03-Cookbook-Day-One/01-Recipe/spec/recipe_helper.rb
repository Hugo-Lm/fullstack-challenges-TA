class RecipeHelper
  attr_reader :file_name
  def initialize
    @file_name = 'recipe'
    @class_name = 'Recipe'
  end

  def file_exists?
    File.exists?("#{__dir__}/../lib/#{@file_name}.rb")
  end

  def class_defined?
    Object.const_defined?(@class_name)
  end

  def file_and_class_valid?
    file_exists? && class_defined?
  end

  def load_file
    require 'recipe'
  end
end
