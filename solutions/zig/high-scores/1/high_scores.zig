pub const HighScores = struct {
    top_scores: [3]i32,
    latest_score: i32,
    len: usize,

    pub fn init(scores: []const i32) HighScores {
        var self: HighScores = .{
            .top_scores = undefined,
            .latest_score = undefined,
            .len = 0,
        };
        for (scores) |s| {
            self.insert(s);
        }
        return self;
    }
    fn insert(self: *HighScores, score: i32) void {
        self.latest_score = score;

        if (self.len < 3) {
            self.top_scores[self.len] = score;
            self.len += 1;
        } else {
            if (score > self.top_scores[2]) {
                self.top_scores[2] = score;
            } else {
                return;
            }
        }

        // Bubble the newly inserted score leftward to its correct position
        var i: usize = self.len - 1;
        while (i > 0) : (i -= 1) {
            if (self.top_scores[i] > self.top_scores[i - 1]) {
                const temp = self.top_scores[i];
                self.top_scores[i] = self.top_scores[i - 1];
                self.top_scores[i - 1] = temp;
            } else {
                break;
            }
        }
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.len > 0)
            return self.latest_score
        else
            return null;
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        if (self.len > 0)
            return self.top_scores[0]
        else
            return null;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        return self.top_scores[0..self.len];
    }
};
