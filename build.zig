const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "zig_sdl2_player",
        .root_source_file = b.path("src/player.zig"),
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });

    exe.linkSystemLibrary("SDL2"); // Link SDL2 dynamically
    exe.linkLibC();

    b.installArtifact(exe);

    // Add a "run" step
    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    b.step("run", "Run the program").dependOn(&run_cmd.step);
}
