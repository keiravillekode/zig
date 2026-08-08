pub const Vehicle = struct {
    plate: []const u8,
    speed_kph: u32,
    warnings: u32 = 0,
};

pub fn record(plate: []const u8, speed_kph: u32) Vehicle {
    _ = plate;
    _ = speed_kph;
    return .{ .plate = "", .speed_kph = 0 };
}

pub fn isSpeeding(vehicle: Vehicle, limit_kph: u32) bool {
    _ = vehicle;
    _ = limit_kph;
    return false;
}

pub fn warn(vehicle: Vehicle) Vehicle {
    return vehicle;
}

pub fn fineInPounds(vehicle: Vehicle, limit_kph: u32) u32 {
    _ = vehicle;
    _ = limit_kph;
    return 0;
}
