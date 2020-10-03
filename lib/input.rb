class Input
  attr_reader :year
  def initialize
    @year = ARGV[0] # ARGV[0].to_i > 0 ? ARGV[0].to_i : Date.today.year
    # interval 15
    # start Date
    # end Date
    # region (for holidays) # !ARGV[1].nil? ? ARGV[1] : 'de'
    # queue name
    # opening hours
  end
end
