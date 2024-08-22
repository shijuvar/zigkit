const std = @import("std");

pub fn main() void {
    const student = Student{
        .id = 10001,
        .name = "Agnes Maria",
        .grade = 1,
    };

    student.getDetails();
}

pub const Student = struct {
    id: u32,
    name: []const u8,
    grade: u8,

    pub fn getDetails(self: Student) void {
        std.debug.print("Student id:{d}, name:{s}, grade: {d}\n", .{ self.id, self.name, self.grade });
    }
};
