const std = @import("std");
pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const who = name orelse "you";
    const slice = try std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{who});
    const len = slice.len;
    return buffer[0..len];
}
