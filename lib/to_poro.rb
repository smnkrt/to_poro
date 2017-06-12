require "to_poro/version"

module ToPoro
  def to_poro(*attributes)
    type = Struct.new(*attributes)
    pluck(*attributes).map { |a| type.new(*a) }
  end
end
