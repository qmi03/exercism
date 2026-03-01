pub fn eggCount(number: usize) usize {
    var count: usize = 0;
    for (0..@bitSizeOf(usize)) |i| {
        const shifted_number = number >> @truncate(i);
        if (shifted_number & 1 == 1) count += 1;
        if (shifted_number == 0) break;
    }
    return count;
}
