const std = @import("std");

pub fn main() !void {
    const file = "file.txt";

    try readFile(file);
}

// readFile reads a given file and prints the words by splitting with a space (" ")
fn readFile(fileName: []const u8) !void {
    const file = try std.fs.cwd().openFile(fileName, .{});
    defer file.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const read_buf = try file.readToEndAlloc(allocator, 1024 * 1024);
    defer allocator.free(read_buf);

    // try std.io.getStdOut().writeAll(read_buf);
    // creating a split iterator with a space (" ")
    var iterator = std.mem.split(u8, read_buf, " ");
    while (iterator.next()) |str| {
        std.debug.print("{s}\n", .{str});
    }
}
