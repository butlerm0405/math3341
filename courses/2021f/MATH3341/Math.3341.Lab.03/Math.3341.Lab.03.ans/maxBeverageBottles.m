function totalBottles = maxBeverageBottles(money, pricePerNewBottle, capsPerNewBottle, emptyBottlesPerNewBottle)
  
totalBottles = floor(money / pricePerNewBottle);
caps = totalBottles;
emptyBottles = totalBottles;

while caps >= capsPerNewBottle || emptyBottles >= emptyBottlesPerNewBottle
    newBottles = floor(caps / capsPerNewBottle) + floor(emptyBottles / emptyBottlesPerNewBottle);
    caps = mod(caps, capsPerNewBottle) + newBottles;
    emptyBottles = mod(emptyBottles, emptyBottlesPerNewBottle) + newBottles;
    totalBottles = totalBottles + newBottles;
end

end