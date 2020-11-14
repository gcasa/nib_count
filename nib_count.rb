require 'strscan'

class NibCount
  def read_nib
    @file = File.open(@name)
    @data = @file.read
  end

  def substring_positions(regexp,substring_len)
    s = StringScanner.new(@data)
    # regexp = Regexp.new(substring)
    positions = []
    positions << (s.pos - substring_len) while s.scan_until(regexp)
    positions
  end

  def enumerate_objects
    # puts @data
    array = substring_positions(/\n\t\t<[a-zA-Z]/, 5)
    # puts array
    o = 0
    p = 0
    array.each do |n|
      i = n.to_i
      @data.insert(i + 2 + p, o.to_s)
      p = p + o.to_s.length
      o = o + 1
    end
      # puts array
    puts @data
  end

  def initialize
    super
    @name = "/Users/heron/Desktop/MainMenu.nib"
  end
end

nc = NibCount.new
nc.read_nib
nc.enumerate_objects

