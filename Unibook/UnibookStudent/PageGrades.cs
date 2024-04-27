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

namespace Unibook.UnibookStudent
{
    public partial class PageGrades : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageGrades()
        {
            InitializeComponent();
            SetCourseSemesterIndex();
            dataGridViewGrades.Rows.Add(StudentLogin.Name+" "+StudentLogin.Surname +" " +StudentLogin.FatherName);
            GetMajorSubjects();
        }
        private List<int> GetCourseSemesterIndex()
        {
            int course = 1;
            int semester = 0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select EntranceYear from Student where GroupName='{StudentLogin.GroupName}' group by GroupName,EntranceYear";
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
                command.CommandText = $"select Major from Groups where Name='{StudentLogin.GroupName}'";
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
            for (int i = 1; i <= 5; i++)
            {
                dataGridViewGrades[i, 0].Value = "";
            }
            if (ShowStudentsGrades())
            {
                dataGridViewGrades.Visible = true;
                for (int i = 1; i <= 5; i++)
                {

                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select Grade from StudentGrades where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder=@GO";
                        command.Parameters.AddWithValue("@GN", StudentLogin.GroupName);
                        command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command.Parameters.AddWithValue("@StN", dataGridViewGrades.Rows[0].Cells[0].Value);
                        command.Parameters.AddWithValue("@GO", dataGridViewGrades.Columns[i].HeaderText);
                        var data = command.ExecuteReader();
                        if (data.Read())
                        {
                            dataGridViewGrades[i, 0].Value = data.GetInt32(0);
                            dataGridViewGrades[i, 0].Style.Alignment = DataGridViewContentAlignment.MiddleCenter;

                        }
                    }


                }
                dataGridViewGrades[6, 0].Value = 0;
                for (int i =1; i <=5; i++)
                {
                    
                        int grade = 0;
                        if (dataGridViewGrades[i, 0].Value != null && dataGridViewGrades[i, 0].Value != "")
                        {
                            grade = int.Parse(dataGridViewGrades[i, 0].Value.ToString());
                        }
                        dataGridViewGrades[6, 0].Value = int.Parse(dataGridViewGrades[6, 0].Value.ToString()) + grade;

                    

                }

            }
            else
            {
                dataGridViewGrades.Visible = false;
            }

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
            GetStudentGrades();
        }
    }
}
