using System.ComponentModel.Design;
using System.Runtime.CompilerServices;
using System.Text.Json;
using System.Xml.Linq;

namespace wk12
{
    internal class Program
    {
        static List<Student> students = new List<Student>(); // default is 4 yet it can expand

        static void Save() 
        {
            // Save this list to a file
            string JsonString = JsonSerializer.Serialize(students, new JsonSerializerOptions { WriteIndented = true }); // Format it property

            File.WriteAllText("student.json", JsonString);

        }
        static void Load() 
        {
            // Load the list from a file
            if(!File.Exists("student.json"))
            {
                Console.WriteLine("File is not loaded");
                return;
            }

            string JsonString = File.ReadAllText("student.json");
            students = JsonSerializer.Deserialize<List<Student>>(JsonString);

            Console.WriteLine("File is loaded");
        }


        static string? Menu()
        {
            Console.WriteLine("====================Application================");
            Console.WriteLine("1 - Add a student to the list");
            Console.WriteLine("2 - View all the students from the list");
            Console.WriteLine("3 - View specific student with ID");
            Console.WriteLine("4 - Exit");
            Console.WriteLine("Enter 1,2,3,4: ");

            return Console.ReadLine();
        }
        static void Main(string[] args)
        {
            bool programEnd = false;
            Load();

            while (!programEnd) 
            {
                var choice = Menu();
                {
                    switch (choice)
                    {
                        case "1": AddStudentToTheList();break;
                        case "2": ViewAllStudentList(); break;
                        case "3": FindSpecificStudent();break;
                        case "4": programEnd = true; break;
                        default: Console.WriteLine("Bad Input"); break;
                    }
                }
            }

            
        }

        private static void AddStudentToTheList()
        {
            Student student = new Student();
            Console.WriteLine("Enter the name of the student");
            student.Name = Console.ReadLine();
            Console.WriteLine("How many course you like to add");
            var nCourses = int.Parse(Console.ReadLine());

            if (nCourses > 0) 
            {
                string[] courses = new string[nCourses];
                double[] marks = new double[nCourses];

                for (int i = 0; i < nCourses; i++)
                {
                    Console.WriteLine($"Name of the course {i + 1}: ");
                    courses[i] = Console.ReadLine();
                    Console.WriteLine($"Enter {courses[i]} Marks: ");
                    marks[i] = double.Parse(Console.ReadLine());
                }

                student.Courses = courses;
                student.Marks = marks;
            }
            students.Add(student);
            Console.Clear(); // add the student to the list
            Console.WriteLine($"Student Added to the list");
            Save();
        }


        private static void ViewAllStudentList()
        {
            Console.Clear();
            foreach (Student student in students) 
            {
                Console.WriteLine(student);
                Console.WriteLine("======================================");
            }

        }

        private static void FindSpecificStudent()
        {
            Console.Clear();
            Console.WriteLine("Enter the student ID: ");
            var id = int.Parse(Console.ReadLine());

            foreach (var student in students)
            {
                if(student.Id == id)
                {
                    Console.WriteLine("Student Found. ");
                    Console.WriteLine(student);
                    return;
                }
                else
                {
                    Console.WriteLine("Student not found");
                }
                
            }
        }


    }
}
