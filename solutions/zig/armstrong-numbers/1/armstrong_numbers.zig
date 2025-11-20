const std = @import("std");
const math = std.math;
pub fn isArmstrongNumber(num: u128) bool {
    var buffer: [40]u4 = undefined;
    var digit_list = std.array_list.Aligned(u4, null).initBuffer(&buffer);

    var remaining: u128 = num;
    while (remaining > 0) : (remaining /= 10) {
        digit_list.appendAssumeCapacity(@truncate(remaining % 10));
    }

    var sum: u256 = 0;
    for (digit_list.items) |digit| {
        sum += math.powi(u256, digit, digit_list.items.len) catch unreachable;
    }
    return sum == num;
}
