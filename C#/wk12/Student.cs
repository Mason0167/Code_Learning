using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace wk12
{
    internal class Student
    {
        static int idGenerator = 0;
        public int Id { get; }
        public string Name { get; set; }
        public string[] Courses { get; set; }// these two are parallel
        public double[]Marks { get; set; }

        public Student()
        {
            Id = ++idGenerator;
        }

        public Student(string name, string[] courses, double[] marks)
        {
            if (courses.Length != marks.Length)
                throw new ArrayTypeMismatchException("The size are not the same");
            Id = ++idGenerator;
            Name = name;
            Courses = courses;
            Marks = marks;

        }

        public double GetAvgMarks()
        {
            if (Marks == null) return 0; return Marks.Average();
        }

        public override string? ToString()
        {
            string output = $"Student ID: {Id}, Name: {Name}";

            if (Marks == null || Marks.Length == 0)
                output += "--> no mark or course is available";
            else
            {
                for(int i = 0; i < Marks.Length; i++)
                {
                    output += $"\nAverage = {GetAvgMarks():F2}";

                }
                
            }
            return output;

        }
    }
}

