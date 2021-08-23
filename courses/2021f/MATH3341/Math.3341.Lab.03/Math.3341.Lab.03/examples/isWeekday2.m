function isWeekday2(day)
%ISWEEKDAY2 Check whether day is a weekday
% Syntax:
%    isWeekday2(day)
% Example
%    isWeekday2('Monday')
%    isWeekday2('Tuesday')

switch day
    case {'Monday', 'Tuesday', 'Wednesday', ...
            'Thursday', 'Friday'}
        fprintf('%s is weekday.\n', day)
    case {'Saturday', 'Sunday'}
        fprintf('%s is weekend.\n', day)
    otherwise
        fprintf('Error!\n')
end

end
