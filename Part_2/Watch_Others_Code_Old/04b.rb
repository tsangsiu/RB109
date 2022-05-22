# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

require "Date"

def friday_13th(year)
  n_friday_13th = 0
  1.upto(12) do |month|
    date = Date.new(year, month, 13)
    n_friday_13th += 1 if date.friday?
  end
  n_friday_13th
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
