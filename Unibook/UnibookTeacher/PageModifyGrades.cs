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
using System.Xml.Linq;
using Unibook.UnibookAdmin;

namespace Unibook.UnibookTeacher
{
    public partial class PageModifyGrades : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        string GroupName;
        string Subject;
        string Major;
        List<int> indexes;
        public PageModifyGrades(string GroupName, string Subject)
        {
            InitializeComponent();
            this.GroupName = GroupName;
            this.Subject = Subject;
            indexes = GetCourseSemesterIndex();
            GetStudentGrades();
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
        private void GetGroupStudents()
        {
            dataGridViewGrades.Rows.Clear();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Name,Surname,FatherName from Student where GroupName='{GroupName}'";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    dataGridViewGrades.Rows.Add(data.GetString(0) + " " + data.GetString(1) + " " + data.GetString(2));
                }
            }
        }
        private void GetStudentGrades()
        {
            GetGroupStudents();
            for (int i = 0; i < dataGridViewGrades.RowCount; i++)
            {
                for (int j = 1; j <= 5; j++)
                {
                    dataGridViewGrades[j, i].Value = "";
                }

            }
            for (int i = 1; i <= 5; i++)
            {
                for (int j = 0; j < dataGridViewGrades.RowCount; j++)
                {
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select Grade from StudentGrades where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder=@GO";
                        command.Parameters.AddWithValue("@GN", GroupName);
                        command.Parameters.AddWithValue("@SN", Subject);
                        command.Parameters.AddWithValue("@StN", dataGridViewGrades.Rows[j].Cells[0].Value);
                        command.Parameters.AddWithValue("@GO", dataGridViewGrades.Columns[i].HeaderText);
                        var data = command.ExecuteReader();
                        if (data.Read())
                        {
                            dataGridViewGrades[i, j].Value = data.GetInt32(0);
                            dataGridViewGrades[i, j].Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

                        }
                    }
                }

            }
            for (int i = 0; i < dataGridViewGrades.RowCount; i++)
            {
                dataGridViewGrades[6, i].Value = 0;
                for (int j = 1; j <= 5; j++)
                {
                    int grade = 0;
                    if (dataGridViewGrades[j, i].Value != null && dataGridViewGrades[j, i].Value != "")
                    {
                        grade = int.Parse(dataGridViewGrades[j, i].Value.ToString());
                    }
                    dataGridViewGrades[6, i].Value = int.Parse(dataGridViewGrades[6, i].Value.ToString()) + grade;

                }

            }
        }

        private void dataGridViewGrades_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int EntranceYear = 0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select EntranceYear from Student where GroupName='{GroupName}' group by GroupName,EntranceYear";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    EntranceYear = data.GetInt32(0);
                }
            }
            DateTime Deadline = DateTime.Now.AddYears(-1);
            if (DateTime.Now.Year - EntranceYear == indexes[0])
            {
                if (indexes[1] == 0)
                {
                    Deadline = DateTime.Parse($"02/15/{DateTime.Now.Year}");
                }
                else
                {
                    Deadline = DateTime.Parse($"07/15/{DateTime.Now.Year}");
                }
            }
            else if (DateTime.Now.Year - EntranceYear == indexes[0]-1)
            {
                Deadline = DateTime.Parse($"02/15/{DateTime.Now.Year + 1}");
            }
            if (DateTime.Now <= Deadline)
            {
                if (e.ColumnIndex > 0 && e.RowIndex >= 0 && e.ColumnIndex != 6)
                {
                    Grades grades = new Grades(GroupName, Subject, dataGridViewGrades.Rows[e.RowIndex].Cells[0].Value.ToString(), dataGridViewGrades.Columns[e.ColumnIndex].HeaderText);
                    grades.ShowDialog();
                    GetStudentGrades();
                }
            }
               

        }
    }

}
