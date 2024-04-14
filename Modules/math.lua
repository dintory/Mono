local Bazier = {}

function Bazier:Cubic(Time, Starting_Point, Starting_Direction, Ending_Direction, End_point)
    local tPow2 = Time * Time
    local tPow3 = tPow2 * Time 
    local invT = 1 - Time
    local invTPow2 = invT * invT
    local invTPow3 = invTPow2 * invT
    
    return invTPow3 * Starting_Point + 3 * invTPow2 * Time * Starting_Point + 3 * invT * tPow2 * Ending_Direction + tPow3 * End_point 
end



return Bazier
