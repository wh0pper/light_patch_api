class State < ApplicationRecord
  before_save do
    self.color.gsub!(/#/, '0x')
  end
end
