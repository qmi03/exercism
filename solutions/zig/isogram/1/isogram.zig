pub fn isIsogram(str: []const u8) bool {
    const std = @import("std");
    var gpa = std.heap.GeneralPurposeAllocator(.{});
    defer _ = gpa.deinit();

    var char_set = std.AutoHashMap(u8, void).init(gpa);
    for (str) |c| {
        const c_lower = std.ascii.toLower(c);
        if (char_set.contains(c_lower)) {
            return false;
        } else {
            char_set.put(c_lower, {});
        }
    }

    return true;
}
