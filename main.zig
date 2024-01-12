const std = @import("std");

pub fn main() !void {
    std.debug.print("{}", .{try day01_part1()});
}

fn day01_part1() !i32 {
    var file = try std.fs.cwd().openFile("day01-input.txt", .{});
    defer file.close();

    var total: i32 = undefined;
    var buffer: [1024]u8 = undefined;
    while (true) {
        const bytesRead = try file.read(buffer[0..]);
        if (bytesRead == 0) {
            break;
        }

        var first: ?u8 = null;
        var second: ?u8 = null;
        for (buffer, 0..) |char, i| {
            _ = i;

            if (char >= 48 and char <= 57) {
                if (first != null) {
                    first = char - 48;
                } else if (second != null) {
                    second = char - 48;
                }
            }
        }

        total += (first orelse 0) + (second orelse 0);
    }

    return total;
}
