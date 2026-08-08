const std = @import("std");
const testing = std.testing;

const splicer = @import("gene_splicer.zig");

// task 1
test "adenine pairs with thymine" {
    try testing.expectEqual('T', splicer.complement('A'));
}

test "thymine pairs with adenine" {
    try testing.expectEqual('A', splicer.complement('T'));
}

test "cytosine pairs with guanine" {
    try testing.expectEqual('G', splicer.complement('C'));
}

test "guanine pairs with cytosine" {
    try testing.expectEqual('C', splicer.complement('G'));
}

test "contamination passes straight through" {
    try testing.expectEqual('X', splicer.complement('X'));
}

// task 2
test "adenine is a purine" {
    try testing.expect(splicer.isPurine('A'));
}

test "guanine is a purine" {
    try testing.expect(splicer.isPurine('G'));
}

test "cytosine is not a purine" {
    try testing.expect(!splicer.isPurine('C'));
}

test "contamination is not a purine" {
    try testing.expect(!splicer.isPurine('X'));
}

// task 3
test "an adenine pair has two bonds" {
    try testing.expectEqual(2, splicer.bondCount('A'));
}

test "a thymine pair has two bonds" {
    try testing.expectEqual(2, splicer.bondCount('T'));
}

test "a cytosine pair has three bonds" {
    try testing.expectEqual(3, splicer.bondCount('C'));
}

test "a guanine pair has three bonds" {
    try testing.expectEqual(3, splicer.bondCount('G'));
}

test "contamination has no bonds" {
    try testing.expectEqual(0, splicer.bondCount('X'));
}

// task 4
test "the bottom of the lowest band" {
    try testing.expectEqual(1, splicer.qualityBand(0));
}

test "the top of the lowest band" {
    try testing.expectEqual(1, splicer.qualityBand(19));
}

test "the bottom of the second band" {
    try testing.expectEqual(2, splicer.qualityBand(20));
}

test "a middling score" {
    try testing.expectEqual(3, splicer.qualityBand(55));
}

test "the bottom of the highest band" {
    try testing.expectEqual(4, splicer.qualityBand(80));
}

test "a perfect score" {
    try testing.expectEqual(4, splicer.qualityBand(100));
}
