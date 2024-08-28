const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // create a Student on the heap
    var student = try allocator.create(Student);

    // free the memory allocated for the Student at the end of this scope
    defer allocator.destroy(student);

    student.id = 1001;
    student.name = "Agnes Maria";
    student.grade = 1;

    student.updateRank(1);
    std.debug.print("Student-> name: {s}, rank: {d}\n", .{ student.name, student.rank });
}

pub const Student = struct {
    id: u32,
    name: []const u8,
    grade: u8,
    rank: u8 = undefined,

    fn updateRank(self: *Student, rank: u8) void {
        self.rank = rank;
    }
};
