const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var legacy_it = legacy.iterator();
    var actual = std.AutoHashMap(u8, i5).init(allocator);
    errdefer actual.deinit();
    while (legacy_it.next()) |li| {
        for (li.value_ptr.*) |c| {
            try actual.put(std.ascii.toLower(c), li.key_ptr.*);
        }
    }
    return actual;
}
