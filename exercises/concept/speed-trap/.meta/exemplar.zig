const pounds_per_kph_over = 10;

pub const Vehicle = struct {
    plate: []const u8,
    speed_kph: u32,
    warnings: u32 = 0,
};

pub fn record(plate: []const u8, speed_kph: u32) Vehicle {
    return .{ .plate = plate, .speed_kph = speed_kph };
}

pub fn isSpeeding(vehicle: Vehicle, limit_kph: u32) bool {
    return vehicle.speed_kph > limit_kph;
}

pub fn warn(vehicle: Vehicle) Vehicle {
    var warned = vehicle;
    warned.warnings += 1;
    return warned;
}

pub fn fineInPounds(vehicle: Vehicle, limit_kph: u32) u32 {
    if (!isSpeeding(vehicle, limit_kph)) return 0;
    return (vehicle.speed_kph - limit_kph) * pounds_per_kph_over;
}
