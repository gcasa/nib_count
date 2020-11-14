require 'strscan'

class NibCount
  def read_nib
    @data = File.readlines(@name)
  end

  def substring_positions(regexp,substring_len)
    s = StringScanner.new(@data)
    # regexp = Regexp.new(substring)
    positions = []
    positions << (s.pos - substring_len) while s.scan_until(regexp)
    positions
  end

  def enumerate_objects
    result = ""
    regexp = /^\t\t<[a-zA-Z]/
    n = 0
    @data.each do |line|
      i = regexp.match( line )
      if i.nil? == false
        line.insert(1, n.to_s) unless i.nil?
        n = n + 1
      end
      result = result + line
    end
    result
  end

  def initialize
    super
    @name = "/Users/heron/Desktop/MainMenu.nib"
  end
end

nc = NibCount.new
nc.read_nib
result = nc.enumerate_objects
puts result
