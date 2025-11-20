const std = @import("std");
pub fn abbreviate(allocator: std.mem.Allocator, phrase: []const u8) ![]u8 {
    var take_flag = true;
    var abb_arr = try std.ArrayList(u8).initCapacity(allocator, 0);
    defer abb_arr.deinit(allocator);

    for (phrase) |c| {
        if (take_flag and std.ascii.isAlphabetic(c)) {
            try abb_arr.append(allocator, std.ascii.toUpper(c));
            take_flag = false;
        }
        if (c == ' ' or c == '-') take_flag = true;
    }

    return try abb_arr.toOwnedSlice(allocator);
}
