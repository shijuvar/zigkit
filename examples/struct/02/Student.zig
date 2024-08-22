const std = @import("std");

id: u32,
name: []const u8,
class: u8,

const Student = @This();

pub fn getDetails(self: Student) void {
    std.debug.print("Student id:{d}, name:{s}, class: {d}\n", .{ self.id, self.name, self.class });
}

pub fn init(id: u32, name: []const u8, class: u8) Student {
    return .{
        .id = id,
        .name = name,
        .class = class,
    };
}
