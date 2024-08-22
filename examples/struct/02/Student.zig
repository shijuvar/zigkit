const std = @import("std");

id: u32,
name: []const u8,
grade: u8,

const Student = @This();

pub fn getDetails(self: Student) void {
    std.debug.print("Student id:{d}, name:{s}, grade: {d}\n", .{ self.id, self.name, self.grade });
}

pub fn init(id: u32, name: []const u8, grade: u8) Student {
    return .{
        .id = id,
        .name = name,
        .grade = grade,
    };
}
