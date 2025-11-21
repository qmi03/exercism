// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{IllegalArgument};

pub fn steps_recursive_helper(number: usize, step_count: usize) usize {
    if (number == 1) return step_count;
    if (number % 2 == 0) {
        return steps_recursive_helper(number / 2, step_count + 1);
    } else {
        return steps_recursive_helper(number * 3 + 1, step_count + 1);
    }
}
pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return ComputationError.IllegalArgument;
    return steps_recursive_helper(number, 0);
}
