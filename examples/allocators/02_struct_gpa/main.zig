const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // create a Student on the heap
    var student = try Student.init(allocator, 10001, "Agnes Maria", 1);

    // free the memory allocated for the Student at the end of this scope
    defer allocator.destroy(student);

    student.updateRank(1);
    std.debug.print("Student-> name: {s}, rank: {d}\n", .{ student.name, student.rank });
}

pub const Student = struct {
    id: u32,
    name: []const u8,
    grade: u8,
    rank: u8 = undefined,

    fn init(allocator: std.mem.Allocator, id: u32, name: []const u8, grade: u8) !*Student {
        const student = try allocator.create(Student);
        student.* = .{
            .id = id,
            .name = name,
            .grade = grade,
        };
        return student;
    }

    fn updateRank(self: *Student, rank: u8) void {
        self.rank = rank;
    }
};
