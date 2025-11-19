pub fn isIsogram(str: []const u8) bool {
    const std = @import("std");
    var gpa: std.heap.DebugAllocator(.{}) = .init;
    defer _ = gpa.deinit();

    var char_set = std.AutoHashMap(u8, void).init(gpa.allocator());
    defer char_set.deinit();
    for (str) |c| {
        const c_lower = std.ascii.toLower(c);
        if (c_lower == ' ' or c_lower == '-') continue;
        if (char_set.contains(c_lower)) {
            return false;
        } else {
            char_set.put(c_lower, {}) catch unreachable;
        }
    }

    return true;
}
