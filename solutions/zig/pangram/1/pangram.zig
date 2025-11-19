pub fn isPangram(str: []const u8) bool {
    const std = @import("std");
    const alphabet = "abcdefghijklmnopqrstuvwxyz";
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .init;
    defer _ = gpa.deinit();

    var alphabet_checklist = std.AutoHashMap(u8, bool).init(gpa.allocator());
    defer alphabet_checklist.deinit();
    for (alphabet) |c| {
        alphabet_checklist.put(c, false) catch unreachable;
    }

    for (str) |c| {
        const c_lower = std.ascii.toLower(c);
        alphabet_checklist.put(c_lower, true) catch unreachable;
    }
    var it = alphabet_checklist.valueIterator();
    while (it.next()) |entry| {
        if (!entry.*) return false;
    }
    return true;
}
