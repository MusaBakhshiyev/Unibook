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
    public partial class PageParticipation : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        List<DateTime> allDateTimes = new List<DateTime>();
        int index;
        public PageParticipation()
        {
            InitializeComponent();
            SetCourseSemesterIndex();
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


        private bool subjectParticipatesShow()
        {
            int course = 0;
            int semester = 1;
            bool subjectParticipatesShow = false;
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

            }
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

        private void GetLessonAllTimes()
        {
            if (subjectParticipatesShow())
            {
                List<DateTime> dateTimes = new List<DateTime>();
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select Year,DayOfWeek,StartTime from GroupLessonTime gl join Groups g on gl.GroupName=g.Name where GroupName='{StudentLogin.GroupName}' and SubjectName='{comboBoxSubject.Text}'";
                    var data = command.ExecuteReader();
                    DateTime date = default;
                    while (data.Read())
                    {
                        if (comboBoxSemester.Text == "Autumn")
                        {
                            date = new DateTime(data.GetInt32(0) - Convert.ToInt32(comboBoxCourse.Text) + 1, 9, 15, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
                        }
                        else
                        {
                            date = new DateTime(data.GetInt32(0) - Convert.ToInt32(comboBoxCourse.Text) + 2, 2, 16, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
                        }
                        switch (data.GetString(1))
                        {
                            case "Monday":
                                dateTimes.Add(date.AddDays((DayOfWeek.Monday - date.DayOfWeek + 7) % 7));
                                break;
                            case "Tuesday":
                                dateTimes.Add(date.AddDays((DayOfWeek.Tuesday - date.DayOfWeek + 7) % 7));
                                break;
                            case "Wednesday":
                                dateTimes.Add(date.AddDays((DayOfWeek.Wednesday - date.DayOfWeek + 7) % 7));
                                break;
                            case "Thursday":
                                dateTimes.Add(date.AddDays((DayOfWeek.Thursday - date.DayOfWeek + 7) % 7));
                                break;
                            case "Friday":
                                dateTimes.Add(date.AddDays((DayOfWeek.Friday - date.DayOfWeek + 7) % 7));
                                break;
                            default:
                                MessageBox.Show("There is no lesson today");
                                break;
                        }
                    }
                    dateTimes.Sort();
                    allDateTimes.Clear();
                    DateTime lastDay;
                    if (comboBoxSemester.Text == "Autumn")
                    {
                        lastDay = new DateTime(date.Year + 1, 2, 15);
                    }
                    else
                    {
                        lastDay = new DateTime(date.Year, 7, 15);
                    }
                    while (dateTimes.Max() <= lastDay)
                    {
                        for (int i = 0; i < dateTimes.Count; i++)
                        {
                            if (dateTimes[i] < date.AddMonths(5))
                                allDateTimes.Add(dateTimes[i]);
                            dateTimes[i] = dateTimes[i].AddDays(7);
                        }
                    }

                }
            }
        }
        private void GetStudentParticipation()
        {
            for (int i = 1; i < dataGridViewParticipates.ColumnCount; i++)
            {

                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select Participation from Participation where GroupName ='{StudentLogin.GroupName}' and SubjectName='{comboBoxSubject.Text}' and StudentName=N'{dataGridViewParticipates[0, 0].Value}' and  Date = '{allDateTimes[(index / 7) * 7 + i - 1]}'";
                    var data = command.ExecuteReader();
                    if (data.Read())
                    {
                        dataGridViewParticipates[i, 0].Value = data.GetString(0);
                        dataGridViewParticipates[i, 0].Style.Font = new Font("Segoe UI", 8, FontStyle.Bold);
                        dataGridViewParticipates[i, 0].Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                        if (data.GetString(0) == "PARTICIPATE")
                        {
                            dataGridViewParticipates[i, 0].Style.BackColor = Color.Blue;

                        }
                        else
                        {
                            dataGridViewParticipates[i, 0].Style.BackColor = Color.Red;
                        }

                        dataGridViewParticipates[i, 0].Style.ForeColor = Color.White;
                    }
                }


            }
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select count(*) from Participation where GroupName ='{StudentLogin.GroupName}' and SubjectName='{comboBoxSubject.Text}' and StudentName=N'{dataGridViewParticipates[0, 0].Value}' and Participation='Absent'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    labelAbsentNumber.Text = "Absent Number: " + data.GetInt32(0).ToString();
                }

            }

        }
        private void GetSubjectParticipates()
        {
            dataGridViewParticipates.Visible = false;
            buttonBack.Visible = false;
            buttonNext.Visible = false;
            labelAbsentNumber.Visible = false;
            if (subjectParticipatesShow())
            {
                dataGridViewParticipates.Visible = true;
                buttonBack.Visible = true;
                buttonNext.Visible = true;
                labelAbsentNumber.Visible = true;
                dataGridViewParticipates.Columns.Clear();
                dataGridViewParticipates.Columns.Add("Students", "Students");
                dataGridViewParticipates.Columns[0].SortMode = DataGridViewColumnSortMode.NotSortable;
                dataGridViewParticipates.Rows.Add(StudentLogin.Name + " " + StudentLogin.Surname + " " + StudentLogin.FatherName);
                index = allDateTimes.FindLastIndex(x => x.Date <= DateTime.Today);

                if (index != -1)
                {
                    index = (index / 7) * 7;
                    for (int i = 0; i < 7; i++)
                    {
                        dataGridViewParticipates.Columns.Add(allDateTimes[index].ToString("dd-MM-yyyy\nHH:mm"), allDateTimes[index].ToString("dd-MM-yyyy\nHH:mm"));
                        dataGridViewParticipates.Columns[i + 1].SortMode = DataGridViewColumnSortMode.NotSortable;
                        if (index + 1 >= allDateTimes.Count || i + 1 >= 7)
                            break;
                        index++;
                    }
                }
                dataGridViewParticipates.Columns[0].Width = 190;
                GetStudentParticipation();
            }

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            if (index >= 7)
            {
                while (dataGridViewParticipates.Columns.Count > 1)
                {
                    dataGridViewParticipates.Columns.RemoveAt(1);
                }
                index = (index / 7 - 1) * 7;

                for (int i = 0; i < 7; i++)
                {
                    dataGridViewParticipates.Columns.Add(allDateTimes[index].ToString("dd-MM-yyyy\nHH:mm"), allDateTimes[index].ToString("dd-MM-yyyy\nHH:mm"));
                    if (index + 1 >= allDateTimes.Count || i + 1 >= 7)
                        break;
                    index++;
                }

            }
            GetStudentParticipation();
        }

        private void buttonNext_Click(object sender, EventArgs e)
        {
            if ((index / 7) * 7 != ((allDateTimes.Count + 6) / 7 - 1) * 7)
            {
                for (int i = 0; i < 7; i++)
                {
                    dataGridViewParticipates.Columns.RemoveAt(1);
                }
                index = (index / 7 + 1) * 7;


                for (int i = 0; i < 7; i++)
                {
                    dataGridViewParticipates.Columns.Add(allDateTimes[index].ToString("dd-MM-yyyy\nHH:mm"), allDateTimes[index].ToString("dd-MM-yyyy \nHH:mm"));
                    if (index + 1 >= allDateTimes.Count || i + 1 >= 7)
                        break;
                    index++;
                }

            }
            GetStudentParticipation();
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
            GetLessonAllTimes();
            GetSubjectParticipates();
        }
    }
}
