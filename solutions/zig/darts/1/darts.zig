const math = @import("std").math;
pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        const dist = self.distance();
        if (dist <= 1) {
            return 10;
        }
        if (dist > 1 and dist <= 5) {
            return 5;
        }
        if (dist > 5 and dist <= 10) {
            return 1;
        }
        return 0;
    }
    fn distance(self: Coordinate) f32 {
        return math.sqrt(self.x * self.x + self.y * self.y);
    }
};
