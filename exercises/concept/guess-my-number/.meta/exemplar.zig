const lowest_guess = 1;
const highest_guess = 100;

pub fn compare(guess: u32, secret: u32) i8 {
    if (guess < secret) {
        return -1;
    } else if (guess > secret) {
        return 1;
    } else {
        return 0;
    }
}

pub fn pointsFor(guesses: u32) u32 {
    if (guesses <= 3) {
        return 10;
    } else if (guesses <= 6) {
        return 5;
    } else {
        return 1;
    }
}

pub fn hintCost(guesses: u32) u32 {
    const cost: u32 = if (guesses <= 4) 1 else 2;
    return cost;
}

pub fn clampGuess(guess: u32) u32 {
    if (guess < lowest_guess) {
        return lowest_guess;
    } else if (guess > highest_guess) {
        return highest_guess;
    } else {
        return guess;
    }
}
