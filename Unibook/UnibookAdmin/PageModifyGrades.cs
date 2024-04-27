using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.Devices;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Unibook.UnibookAdmin
{
    public partial class PageModifyGrades : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        public PageModifyGrades()
        {
            InitializeComponent();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "select Name from Groups";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    comboBoxGroupName.Items.Add(data.GetString(0));
                }
            }
            comboBoxGroupName.SelectedIndex = 0;
        }
        private List<int> GetCourseSemesterIndex()
        {
            int course = 1;
            int semester = 0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select EntranceYear from Student where GroupName='{comboBoxGroupName.SelectedItem}' group by GroupName,EntranceYear";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    if (DateTime.Now >= DateTime.Parse($"09/15/{DateTime.Now.Year}") && DateTime.Now <= DateTime.Parse($"12/31/{DateTime.Now.Year}"))
                    {
                        course = DateTime.Now.Year - data.GetInt32(0) + 1;
                        semester = 0;
                    }
                    else if (DateTime.Now <= DateTime.Parse($"02/15/{DateTime.Now.Year}"))
                    {
                        course = DateTime.Now.Year - data.GetInt32(0);
                        semester = 0;
                    }
                    else
                    {
                        course = course = DateTime.Now.Year - data.GetInt32(0);
                        semester = 1;
                    }
                }
                if (course > 4)
                {
                    course = 4;
                }

                return new List<int> { course, semester };
            }
        }
        private void SetCourseSemesterIndex()
        {
            List<int> index = GetCourseSemesterIndex();
            int course = index[0];
            int semester = index[1];

            comboBoxCourse.SelectedIndexChanged -= comboBoxCourse_SelectedIndexChanged;
            comboBoxCourse.SelectedIndex = course - 1;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            comboBoxSemester.SelectedIndexChanged -= comboBoxSemester_SelectedIndexChanged;
            comboBoxSemester.SelectedIndex = semester;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
        }
        private void GetMajorSubjects()
        {
            string Major = "";
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Major from Groups where Name='{comboBoxGroupName.SelectedItem}'";
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
                command.CommandText = $"select name from SubjectInfo si join Subjects s on si.SubjectId=s.Id where course={comboBoxCourse.Text} and semester = '{comboBoxSemester.Text}' and Major='{Major}'";
                var data = command.ExecuteReader();
                comboBoxSubject.Items.Clear();
                while (data.Read())
                {
                    comboBoxSubject.Items.Add(data.GetString(0));
                }
            }
            comboBoxSubject.SelectedIndex = 0;
        }
        private void GetGroupStudents()
        {
            dataGridViewGrades.Rows.Clear();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Name,Surname,FatherName from Student where GroupName='{comboBoxGroupName.SelectedItem}'";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    dataGridViewGrades.Rows.Add(data.GetString(0) + " " + data.GetString(1) + " " + data.GetString(2));
                }
            }
        }
        private bool ShowStudentsGrades()
        {
            bool subjectParticipatesShow = false;
            List<int> index = GetCourseSemesterIndex();
            int course = index[0];
            int semester = index[1];
            if (int.Parse(comboBoxCourse.Text) == course && comboBoxSemester.SelectedIndex <= semester)
            {
                subjectParticipatesShow = true;
            }
            else if (int.Parse(comboBoxCourse.Text) < course)
            {
                subjectParticipatesShow = true;
            }
            return subjectParticipatesShow;
        }
        private void GetStudentGrades()
        {
            for (int i = 0; i < dataGridViewGrades.RowCount; i++)
            {
                for (int j = 1; j <= 5; j++)
                {
                    dataGridViewGrades[j, i].Value = "";
                }

            }
            if (ShowStudentsGrades())
            {
                dataGridViewGrades.Visible = true;
                for (int i = 1; i <= 5; i++)
                {
                    for (int j = 0; j < dataGridViewGrades.RowCount; j++)
                    {
                        using (var connection = new SqlConnection(constr))
                        {
                            connection.Open();
                            var command = connection.CreateCommand();
                            command.CommandText = $"select Grade from StudentGrades where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder=@GO";
                            command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                            command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
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
                        if (dataGridViewGrades[j, i].Value != null && dataGridViewGrades[j, i].Value!="")
                        {
                            grade = int.Parse(dataGridViewGrades[j, i].Value.ToString());
                        }
                        dataGridViewGrades[6, i].Value = int.Parse(dataGridViewGrades[6, i].Value.ToString()) + grade;

                    }

                }

            }
            else
            {
                dataGridViewGrades.Visible = false;
            }

        }

        private void comboBoxGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetGroupStudents();
            SetCourseSemesterIndex();
            GetMajorSubjects();
            GetStudentGrades();

        }

        private void comboBoxCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetMajorSubjects();
        }

        private void comboBoxSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetMajorSubjects();
        }

        private void comboBoxSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            RandomGrades();
            GetStudentGrades();
        }

        private void dataGridViewGrades_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex > 0 && e.RowIndex >= 0 && e.ColumnIndex != 6)
            {
                Grades grades = new Grades(comboBoxGroupName.Text, comboBoxSubject.Text, dataGridViewGrades.Rows[e.RowIndex].Cells[0].Value.ToString(), dataGridViewGrades.Columns[e.ColumnIndex].HeaderText);
                grades.ShowDialog();
                GetStudentGrades();
            }

        }
        private void RandomGrades()
        {
            int EntranceYear=0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select EntranceYear from Student where GroupName='{comboBoxGroupName.SelectedItem}' group by GroupName,EntranceYear";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    EntranceYear = data.GetInt32(0);
                }
            }
            DateTime Deadline = DateTime.Now.AddYears(-1);
            if (DateTime.Now.Year - EntranceYear == comboBoxCourse.SelectedIndex+1)
            {
                if (comboBoxSemester.SelectedIndex == 0)
                {
                    Deadline = DateTime.Parse($"02/15/{DateTime.Now.Year}");
                }
                else
                {
                    Deadline = DateTime.Parse($"07/15/{DateTime.Now.Year}");
                }
            }
            else if (DateTime.Now.Year - EntranceYear == comboBoxCourse.SelectedIndex)
            {
                Deadline = DateTime.Parse($"02/15/{DateTime.Now.Year+1}");
            }
            if (DateTime.Now > Deadline)
            {
                if (ShowStudentsGrades())
                {
                    for (int i = 1; i <= 5; i++)
                    {
                        for (int j = 0; j < dataGridViewGrades.RowCount; j++)
                        {
                            bool HasRows = false;
                            using (var connection = new SqlConnection(constr))
                            {
                                connection.Open();
                                var command = connection.CreateCommand();
                                command.CommandText = $"select StudentName from StudentGrades where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder = @GO";
                                command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                                command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                                command.Parameters.AddWithValue("@StN", dataGridViewGrades.Rows[j].Cells[0].Value);
                                command.Parameters.AddWithValue("@GO", dataGridViewGrades.Columns[i].HeaderText);
                                var data = command.ExecuteReader();
                                if (data.HasRows)
                                {
                                    HasRows = true;

                                }
                            }
                            if (!HasRows)
                            {

                                using (var connection = new SqlConnection(constr))
                                {
                                    Random random = new Random();
                                    int r = random.Next(0, 11);
                                    int grade;
                                    if (r >= 0 && r <= 9)
                                    {
                                        grade = random.Next(15, 21);
                                    }
                                    else
                                    {
                                        grade = random.Next(0, 21);
                                    }
                                    connection.Open();
                                    var command = connection.CreateCommand();
                                    command.CommandText = $"insert into StudentGrades values(@GN,@SN,@StN,@GO,@G)";
                                    command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                                    command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                                    command.Parameters.AddWithValue("@StN", dataGridViewGrades.Rows[j].Cells[0].Value);
                                    command.Parameters.AddWithValue("@GO", dataGridViewGrades.Columns[i].HeaderText);
                                    command.Parameters.AddWithValue("@G", grade);
                                    command.ExecuteNonQuery();
                                }
                            }

                        }
                    }

                }
            }




        }
    }
}
