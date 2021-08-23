function is_leap_year = isLeapYear(year)

if mod(year, 400) == 0 || (mod(year, 4) == 0 && mod(year, 100) ~= 0)
    is_leap_year = true;
else
    is_leap_year = false;
end

end