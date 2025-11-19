pub fn score(s: []const u8) u32 {
    var scr: u32 = 0;
    for (s) |c| {
        const c_lower = @import("std").ascii.toLower(c);
        switch (c_lower) {
            'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => scr += 1,
            'd', 'g' => scr += 2,
            'b', 'c', 'm', 'p' => scr += 3,
            'f', 'h', 'v', 'w', 'y' => scr += 4,
            'k' => scr += 5,
            'j', 'x' => scr += 8,
            'q', 'z' => scr += 10,
            else => {},
        }
    }
    return scr;
}
