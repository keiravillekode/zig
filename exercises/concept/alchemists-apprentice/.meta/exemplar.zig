const simmer_minutes = 25;
const grinding_minutes_per_ingredient = 3;
const bottle_base_price = 12;
const price_per_ingredient = 4;

pub fn simmerTimeInMinutes() u32 {
    return simmer_minutes;
}

pub fn remainingSimmerTime(elapsed_minutes: u32) u32 {
    return simmerTimeInMinutes() - elapsed_minutes;
}

pub fn grindingTimeInMinutes(ingredients: u32) u32 {
    return grinding_minutes_per_ingredient * ingredients;
}

pub fn priceInCoins(ingredients: u32) u32 {
    return bottle_base_price + price_per_ingredient * ingredients;
}
