const std = @import("std");
const testing = std.testing;

const savings = @import("seedling_savings.zig");

const tolerance = 1e-9;

// task_id = 1
test "interest on a round balance" {
    try testing.expectApproxEqAbs(9.0, savings.interest(200.0, 4.5), tolerance);
}

// task_id = 1
test "interest that is not a round number" {
    try testing.expectApproxEqAbs(3.4375, savings.interest(137.5, 2.5), tolerance);
}

// task_id = 1
test "an empty account earns nothing" {
    try testing.expectApproxEqAbs(0.0, savings.interest(0.0, 4.5), tolerance);
}

// task_id = 2
test "a year of interest is added to the balance" {
    try testing.expectApproxEqAbs(209.0, savings.balanceAfterOneYear(200.0, 4.5), tolerance);
}

// task_id = 2
test "a rate of zero leaves the balance alone" {
    try testing.expectApproxEqAbs(200.0, savings.balanceAfterOneYear(200.0, 0.0), tolerance);
}

// task_id = 3
test "a balance with pennies loses them" {
    try testing.expectEqual(209, savings.wholePounds(209.75));
}

// task_id = 3
test "a whole balance is unchanged" {
    try testing.expectEqual(42, savings.wholePounds(42.0));
}

// task_id = 3
test "less than a pound is no pounds at all" {
    try testing.expectEqual(0, savings.wholePounds(0.99));
}

// task_id = 4
test "an average that divides evenly" {
    try testing.expectApproxEqAbs(125.0, savings.averageDeposit(1000, 8), tolerance);
}

// task_id = 4
test "an average that does not divide evenly" {
    try testing.expectApproxEqAbs(33.75, savings.averageDeposit(135, 4), tolerance);
}

// task_id = 4
test "a single deposit is its own average" {
    try testing.expectApproxEqAbs(7.0, savings.averageDeposit(7, 1), tolerance);
}
