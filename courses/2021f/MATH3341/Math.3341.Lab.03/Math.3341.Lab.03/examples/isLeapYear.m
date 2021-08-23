function is_leap_year = isLeapYear(year)
%ISLEAPYEAR Check whether year is leap year
% Syntax:
%    is_leap_year = isLeapYear(year)
% Example
%    is_leap_year = isLeapYear(2000) % return true (logical 1)
%    is_leap_year = isLeapYear(1900) % return false (logical 0)

if mod(year, 400) == 0 || (mod(year, 4) == 0 && mod(year, 100) ~= 0)
    is_leap_year = true;
else
    is_leap_year = false;
end

end
