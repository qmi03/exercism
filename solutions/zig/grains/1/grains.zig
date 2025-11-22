pub const ChessboardError = error{IndexOutOfBounds};

const grains_table = blk: {
    var arr: [64]u64 = undefined;
    arr[0] = 1;
    for (1..64) |i| {
        arr[i] = arr[i - 1] * 2;
    }
    break :blk arr;
};

pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    return grains_table[index - 1];
}

pub fn total() u64 {
    var sum: u64 = 0;
    for (grains_table) |grains| {
        sum += grains;
    }
    return sum;
}
