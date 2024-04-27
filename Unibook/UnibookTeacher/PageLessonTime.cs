using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Unibook.UnibookTeacher
{
    public partial class PageLessonTime : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        List<DateTime> allDateTimes = new List<DateTime>();
        List<int> indexes;
        string GroupName;
        string Subject;
        string Major;
        string Semester;
        int index;
        public PageLessonTime(string GroupName, string Subject)
        {
            InitializeComponent();
            this.GroupName = GroupName;
            this.Subject = Subject;
            indexes = GetCourseSemesterIndex();
            if (indexes[1] == 0)
            {
                Semester = "Autumn";
            }
            else
            {
                Semester = "Spring";
            }
            GetGroupLessonTime();
        }
        private List<int> GetCourseSemesterIndex()
        {
            int course = 1;
            int semester = 0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Major from Groups where Name='{GroupName}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    Major = data.GetString(0);

                }
            }
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Course,Semester from SubjectInfo si join Subjects s on si.SubjectId=s.Id where s.Name='{Subject}' and si.Major='{Major}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    course = data.GetInt32(0);
                    if (data.GetString(1) == "Spring")
                    {
                        semester = 1;
                    }

                }
            }
            return new List<int> { course, semester };
        }
        private void GetGroupLessonTime()
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select g.SubjectName,DayOfWeek,StartTime from GroupLessonTime g join Teacher t on g.TeacherId=T.Id join Subjects s on g.SubjectName =s.Name join SubjectInfo si on s.Id=si.SubjectId where g.GroupName='{GroupName}' and si.Course={indexes[0]} and si.Semester='{Semester}' and g.TeacherId={TeacherLogin.Id}";
                var data = command.ExecuteReader();
                dataGridViewLessons.Rows.Clear();
                dataGridViewLessons.Rows.Add("Monday");
                dataGridViewLessons.Rows.Add("Tuesday");
                dataGridViewLessons.Rows.Add("Wednesday");
                dataGridViewLessons.Rows.Add("Thursday");
                dataGridViewLessons.Rows.Add("Friday");
                while (data.Read())
                {
                    int i = -1;
                    int j = -1;
                    string Day = data.GetString(1);
                    string Time = data.GetTimeSpan(2).ToString();
                    switch (Day)
                    {
                        case "Monday":
                            i = 0;
                            break;
                        case "Tuesday":
                            i = 1;
                            break;
                        case "Wednesday":
                            i = 2;
                            break;
                        case "Thursday":
                            i = 3;
                            break;
                        case "Friday":
                            i = 4;
                            break;
                        default:
                            MessageBox.Show("There is no such a day", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            break;
                    }
                    switch (Time)
                    {
                        case "09:00:00":
                            j = 1;
                            break;
                        case "10:10:00":
                            j = 2;
                            break;
                        default:
                            MessageBox.Show("There is no such a time", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            break;
                    }
                    dataGridViewLessons.Rows[i].Cells[j].Value = data.GetString(0);
                }
            }
            


        }
    }
}
