const std = @import("std");
const testing = std.testing;

const splicer = @import("gene_splicer.zig");

// task_id = 1
test "adenine pairs with thymine" {
    try testing.expectEqual('T', splicer.complement('A'));
}

// task_id = 1
test "thymine pairs with adenine" {
    try testing.expectEqual('A', splicer.complement('T'));
}

// task_id = 1
test "cytosine pairs with guanine" {
    try testing.expectEqual('G', splicer.complement('C'));
}

// task_id = 1
test "guanine pairs with cytosine" {
    try testing.expectEqual('C', splicer.complement('G'));
}

// task_id = 1
test "contamination passes straight through" {
    try testing.expectEqual('X', splicer.complement('X'));
}

// task_id = 2
test "adenine is a purine" {
    try testing.expect(splicer.isPurine('A'));
}

// task_id = 2
test "guanine is a purine" {
    try testing.expect(splicer.isPurine('G'));
}

// task_id = 2
test "cytosine is not a purine" {
    try testing.expect(!splicer.isPurine('C'));
}

// task_id = 2
test "contamination is not a purine" {
    try testing.expect(!splicer.isPurine('X'));
}

// task_id = 3
test "an adenine pair has two bonds" {
    try testing.expectEqual(2, splicer.bondCount('A'));
}

// task_id = 3
test "a thymine pair has two bonds" {
    try testing.expectEqual(2, splicer.bondCount('T'));
}

// task_id = 3
test "a cytosine pair has three bonds" {
    try testing.expectEqual(3, splicer.bondCount('C'));
}

// task_id = 3
test "a guanine pair has three bonds" {
    try testing.expectEqual(3, splicer.bondCount('G'));
}

// task_id = 3
test "contamination has no bonds" {
    try testing.expectEqual(0, splicer.bondCount('X'));
}

// task_id = 4
test "the bottom of the lowest band" {
    try testing.expectEqual(1, splicer.qualityBand(0));
}

// task_id = 4
test "the top of the lowest band" {
    try testing.expectEqual(1, splicer.qualityBand(19));
}

// task_id = 4
test "the bottom of the second band" {
    try testing.expectEqual(2, splicer.qualityBand(20));
}

// task_id = 4
test "a middling score" {
    try testing.expectEqual(3, splicer.qualityBand(55));
}

// task_id = 4
test "the bottom of the highest band" {
    try testing.expectEqual(4, splicer.qualityBand(80));
}

// task_id = 4
test "a perfect score" {
    try testing.expectEqual(4, splicer.qualityBand(100));
}
