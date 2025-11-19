const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var buf_string = try std.fmt.allocPrint(allocator, "{s}", .{dna});
    for (dna, 0..) |nucl, i| switch (nucl) {
        'G' => buf_string[i] = 'C',
        'C' => buf_string[i] = 'G',
        'T' => buf_string[i] = 'A',
        'A' => buf_string[i] = 'U',
        else => {},
    };
    return buf_string;
}
