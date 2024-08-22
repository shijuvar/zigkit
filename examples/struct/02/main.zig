const Student = @import("Student.zig");

pub fn main() void {
    const student1 = Student{
        .id = 10001,
        .name = "Agnes Maria",
        .class = 1,
    };
    student1.getDetails();

    const student2 = Student.init(10078, "Irene Rose", 10);
    student2.getDetails();
}
