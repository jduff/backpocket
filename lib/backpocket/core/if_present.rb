# http://gist.github.com/647301
#
# str = "string".if_present? do |s|
#   s.reverse!
# end
# 
# str = "string".if_present? do
#   reverse!
# end

class Object
  def if_present?(&block)
    return self unless present?
    if block.arity == -1
      instance_eval(&blk)
    else
      block.call(self)
    end
    self
  end
end

