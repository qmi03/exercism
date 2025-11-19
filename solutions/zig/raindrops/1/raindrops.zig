pub fn convert(buffer: []u8, n: u32) []const u8 {
    const std = @import("std");
    var flag: bool = false;
    var len: usize = 0;
    if (n % 3 == 0) {
        flag = true;
        for ("Pling") |c| {
            buffer[len] = c;
            len += 1;
        }
    }
    if (n % 5 == 0) {
        flag = true;
        for ("Plang") |c| {
            buffer[len] = c;
            len += 1;
        }
    }
    if (n % 7 == 0) {
        flag = true;
        for ("Plong") |c| {
            buffer[len] = c;
            len += 1;
        }
    }

    if (!flag) {
        const slice = std.fmt.bufPrint(buffer, "{d}", .{n}) catch unreachable;
        len = slice.len;
    }

    return buffer[0..len];
}
