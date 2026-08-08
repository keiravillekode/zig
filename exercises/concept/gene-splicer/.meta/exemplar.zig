pub fn complement(base: u8) u8 {
    return switch (base) {
        'A' => 'T',
        'T' => 'A',
        'C' => 'G',
        'G' => 'C',
        else => base,
    };
}

pub fn isPurine(base: u8) bool {
    return switch (base) {
        'A', 'G' => true,
        else => false,
    };
}

pub fn bondCount(base: u8) u8 {
    return switch (base) {
        'A', 'T' => 2,
        'C', 'G' => 3,
        else => 0,
    };
}

pub fn qualityBand(score: u8) u8 {
    return switch (score) {
        0...19 => 1,
        20...49 => 2,
        50...79 => 3,
        else => 4,
    };
}
