const std = @import("std");
const sdl = @cImport(@cInclude("SDL2/SDL.h"));
const print = std.debug.print;
const assert = std.debug.assert;

pub fn main() !void {
    var tick: u64 = 0;

    const flags = sdl.SDL_WINDOW_SHOWN | sdl.SDL_WINDOW_RESIZABLE;

    const window = sdl.SDL_CreateWindow("player", 50, 50, 960, 600, flags);
    defer sdl.SDL_DestroyWindow(window);
    assert(window != null);

    while (true) {
        tick += 1;
        if (tick == 10000000000) {
            break;
        }
    }
}
