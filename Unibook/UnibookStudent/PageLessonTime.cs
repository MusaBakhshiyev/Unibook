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
using Unibook.UnibookAdmin;

namespace Unibook.UnibookStudent
{
    public partial class PageLessonTime : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageLessonTime()
        {
            InitializeComponent();
            SetCourseSemesterIndex();
            GetGroupLessonTime();
        }
        private void SetCourseSemesterIndex()
        {
            using (var connection = new SqlConnection(constr))
            {
                int course = 1;
                int semester = 0;
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


                comboBoxCourse.SelectedIndexChanged -= comboBoxCourse_SelectedIndexChanged;
                comboBoxCourse.SelectedIndex = course - 1;
                comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;

                comboBoxSemester.SelectedIndexChanged -= comboBoxSemester_SelectedIndexChanged;
                comboBoxSemester.SelectedIndex = semester;
                comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            }
        }
        private void GetGroupLessonTime()
        {
            dataGridViewLessons.Visible = false;
            foreach (Control control in panelModifyLessons.Controls)
            {
                if (control is Label && control.Font.Size is 7)
                {
                    control.ResetText();
                }
            }
            bool lessonTimeShow = false;
            using (var connection = new SqlConnection(constr))
            {
                int course = 1;
                int semester = 0;
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
                if (int.Parse(comboBoxCourse.Text) == course && comboBoxSemester.SelectedIndex <= semester)
                {
                    lessonTimeShow = true;
                }
                else if (int.Parse(comboBoxCourse.Text) < course)
                {
                    lessonTimeShow = true;
                }
            }
            if (lessonTimeShow)
            {
                dataGridViewLessons.Visible = true;
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select g.SubjectName,DayOfWeek,StartTime,t.Name,t.Surname from GroupLessonTime g join Teacher t on g.TeacherId=T.Id join Subjects s on g.SubjectName =s.Name join SubjectInfo si on s.Id=si.SubjectId where g.GroupName='{StudentLogin.GroupName}' and si.Course={comboBoxCourse.Text} and si.Semester='{comboBoxSemester.Text}'";
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
                        Rectangle cell = dataGridViewLessons.GetCellDisplayRectangle(j, i, false);
                        Label label = new Label();
                        panelModifyLessons.Controls.Add(label);
                        label.AutoSize = true;
                        label.BackColor = Color.White;
                        label.Font = new Font("Segoe UI", 7, FontStyle.Regular);
                        label.FlatStyle = FlatStyle.Flat;
                        label.Text = data.GetString(3) + " " + data.GetString(4);
                        label.Location = new Point(dataGridViewLessons.Location.X + cell.Right - label.Width - 1, dataGridViewLessons.Location.Y + cell.Bottom - label.Height - 1); ;
                        label.BringToFront();
                    }
                }
            }

        }

        private void comboBoxCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetGroupLessonTime();
        }

        private void comboBoxSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetGroupLessonTime();
        }

    }
}
