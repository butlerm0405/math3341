function isWeekday1(day)
%ISWEEKDAY1 Check whether day is a weekday
% Syntax:
%    isWeekday1(day)
% Example
%    isWeekday1('Monday')
%    isWeekday1('Tuesday')

switch day
    case {'Monday', 'Tuesday', 'Wednesday', ...
            'Thursday', 'Friday'}
        fprintf('%s is weekday.\n', day)
    otherwise
        fprintf('%s is weekend.\n', day)
end

end