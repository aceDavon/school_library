require './base_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    str = @nameable.correct_name
    max = 10
    str.length > max ? str[0...max] : str
  end
end
