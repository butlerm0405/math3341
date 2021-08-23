function dow = dayOfWeek(year, month, day)

numberOfDays = 0;
for y = 1970:(year - 1)
    if isLeapYear(y)
        numberOfDays = numberOfDays + 366;
    else
        numberOfDays = numberOfDays + 365;
    end
end

for m = 1:(month - 1)
    switch m
        case {1, 3, 5, 7, 8, 10, 12}
            numberOfDays = numberOfDays + 31;
        case {4, 6, 9, 11}
            numberOfDays = numberOfDays + 30;
        case 2
            if isLeapYear(year)
                numberOfDays = numberOfDays + 29;
            else
                numberOfDays = numberOfDays + 28;
            end
    end
end

numberOfDays = mod(numberOfDays + day - 1, 7);

switch numberOfDays
    case 0
        dow = 'Thursday';
    case 1
        dow = 'Friday';
    case 2
        dow = 'Saturday';
    case 3
        dow = 'Sunday';
    case 4
        dow = 'Monday';
    case 5
        dow = 'Tuesday';
    case 6
        dow = 'Wednesday';
end

end