const std = @import("std");
const mem = std.mem;
pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var multiple_set = std.AutoHashMap(u32, void).init(allocator);
    defer multiple_set.deinit();
    for (factors) |factor| {
        if (factor == 0) continue;
        var multiplier: u32 = 1;
        var largest_multiple: u32 = factor;
        while (largest_multiple < limit) {
            try multiple_set.put(largest_multiple, {});
            multiplier += 1;
            largest_multiple = multiplier * factor;
        }
    }
    var it = multiple_set.keyIterator();
    var s: u64 = 0;
    while (it.next()) |key| {
        s += key.*;
    }
    return s;
}
