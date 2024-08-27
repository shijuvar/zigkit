const std = @import("std");

pub fn main() void {
    const items = [_]u32{ 100, 200, 300, 400, 500 };
    const arr = items[1..4];
    std.debug.print("type: {any}\n", .{@TypeOf(arr)});
    printArray(arr);

    const start: usize = 0;
    var end: usize = 3;
    end += 1;
    const slice = items[start..end];
    std.debug.print("type: {any}\n", .{@TypeOf(slice)});
    printArray(slice);

    const slice1: []const u32 = &.{ 1000, 2000, 3000 };
    std.debug.print("type: {any}\n", .{@TypeOf(slice1)});
    printArray(slice1);
}

fn printArray(items: []const u32) void {
    for (0..items.len) |i| std.debug.print("index:{}, value:{}\n", .{ i, items[i] });
}
