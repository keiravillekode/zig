pub const Link = struct {
    id: u32,
    next: ?*const Link = null,
};

pub fn addOne(tally: *u32) void {
    _ = tally;
}

pub fn swap(first: *u32, second: *u32) void {
    _ = first;
    _ = second;
}

pub fn renumber(link: *Link, id: u32) void {
    _ = link;
    _ = id;
}

pub fn chainLength(head: ?*const Link) u32 {
    _ = head;
    return 0;
}
