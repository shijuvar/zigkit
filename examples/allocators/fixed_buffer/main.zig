const std = @import("std");

pub fn main() !void {
    var buf: [200]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);

    // reset will free all memory allocate with FixedBufferAllocator
    defer fba.reset();

    const allocator = fba.allocator();

    // stores the result in dynamically allocated memory
    const json_doc = try std.json.stringifyAlloc(allocator, .{
        .id = 10001,
        .name = "Agnes Maria",
        .grade = 1,
        .rank = 1,
    }, .{ .whitespace = .indent_3 });

    // freeing allocator
    defer allocator.free(json_doc);

    std.debug.print("{s}\n", .{json_doc});
}
