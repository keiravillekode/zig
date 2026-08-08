pub const Link = struct {
    id: u32,
    next: ?*const Link = null,
};

pub fn addOne(tally: *u32) void {
    tally.* += 1;
}

pub fn swap(first: *u32, second: *u32) void {
    const held = first.*;
    first.* = second.*;
    second.* = held;
}

pub fn renumber(link: *Link, id: u32) void {
    link.id = id;
}

pub fn chainLength(head: ?*const Link) u32 {
    var length: u32 = 0;
    var current = head;
    while (current) |link| {
        length += 1;
        current = link.next;
    }
    return length;
}
