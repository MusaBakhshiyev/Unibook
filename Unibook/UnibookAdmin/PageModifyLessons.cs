using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Unibook.UnibookAdmin
{
    public partial class PageModifyLessons : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageModifyLessons()
        {
            InitializeComponent();
        }

        private void PageModifyLessons_Load(object sender, EventArgs e)
        {
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

            comboBoxGroupName.SelectedIndexChanged -= comboBoxGroupName_SelectedIndexChanged;
            comboBoxGroupName.SelectedIndex = 0;
            comboBoxGroupName.SelectedIndexChanged += comboBoxGroupName_SelectedIndexChanged;
            SetCourseSemesterIndex();
            GetMajorSubjects();
            GetSubjcetTeachers();
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


                comboBoxCourse.SelectedIndexChanged -= comboBoxCourse_SelectedIndexChanged;
                comboBoxCourse.SelectedIndex = course - 1;
                comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;

                comboBoxSemester.SelectedIndexChanged -= comboBoxSemester_SelectedIndexChanged;
                comboBoxSemester.SelectedIndex = semester;
                comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            }
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
        }
        private void GetSubjcetTeachers()
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select t.Id,t.Name,t.Surname,t.FatherName from Teacher t join TeacherSubjects ts on t.Id=ts.TeacherId join Subjects s on s.Id=ts.SubjectId where s.Name='{comboBoxSubject.SelectedItem}'";
                var data = command.ExecuteReader();
                comboBoxTeacher.Items.Clear();
                while (data.Read())
                {
                    comboBoxTeacher.Items.Add(data.GetInt32(0) + ". " + data.GetString(1) + " " + data.GetString(2) + " " + data.GetString(3));
                }
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
                command.CommandText = $"select EntranceYear from Student where GroupName='{comboBoxGroupName.Text}' group by GroupName,EntranceYear";
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
                    command.CommandText = $"select g.SubjectName,DayOfWeek,StartTime,t.Name,t.Surname from GroupLessonTime g join Teacher t on g.TeacherId=T.Id join Subjects s on g.SubjectName =s.Name join SubjectInfo si on s.Id=si.SubjectId where g.GroupName='{comboBoxGroupName.Text}' and si.Course={comboBoxCourse.Text} and si.Semester='{comboBoxSemester.Text}'";
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
        private void buttonAdd_Click(object sender, EventArgs e)
        {
            bool GroupHasLesson = true;
            bool TeacherHasLesson = true;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select GroupName from GroupLessonTime where GroupName='{comboBoxGroupName.Text}' and DayOfWeek='{comboBoxDayOfWeek.Text}' and StartTime='{TimeSpan.Parse(comboBoxTime.Text.Split("-")[0])}' and SubjectName='{comboBoxSubject.Text}'";
                var data = command.ExecuteReader();
                if (!data.HasRows)
                {
                    GroupHasLesson = false;
                }
            }
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select GroupName from GroupLessonTime where TeacherId='{comboBoxTeacher.Text.Split(".")[0]}' and DayOfWeek='{comboBoxDayOfWeek.Text}' and StartTime='{TimeSpan.Parse(comboBoxTime.Text.Split("-")[0])}' and SubjectName='{comboBoxSubject.Text}'";
                var data = command.ExecuteReader();
                if (!data.HasRows)
                {
                    TeacherHasLesson = false;
                }
            }
            if (!GroupHasLesson)
            {
                if (!TeacherHasLesson)
                {
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"insert into GroupLessonTime values (@GN,@SN,@DOW,@T,@TI)";
                        command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                        command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command.Parameters.AddWithValue("@DOW", comboBoxDayOfWeek.Text);
                        command.Parameters.AddWithValue("@T", TimeSpan.Parse($"{comboBoxTime.Text.Split("-")[0]}"));
                        command.Parameters.AddWithValue("@TI", comboBoxTeacher.Text.Split(".")[0]);
                        command.ExecuteNonQuery();
                    }
                }
                else
                {
                    MessageBox.Show("Teacher has lesson in this time");
                }
            }
            else
            {
                MessageBox.Show("Group has lesson in this time");
            }
            GetGroupLessonTime();

        }
        private void buttonDelete_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"delete from GroupLessonTime where GroupName='{comboBoxGroupName.Text}' and DayOfWeek='{comboBoxDayOfWeek.Text}' and StartTime='{TimeSpan.Parse(comboBoxTime.Text.Split("-")[0])}' and SubjectName='{comboBoxSubject.Text}'";
                var dialogresult = MessageBox.Show("Are you sure to delete this lesson time", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                if (dialogresult == DialogResult.Yes)
                {
                    command.ExecuteNonQuery();
                }
            }
            GetGroupLessonTime();
        }
        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"update GroupLessonTime set SubjectName='{comboBoxSubject.Text}', DayOfWeek='{comboBoxDayOfWeek.Text}',StartTime='{TimeSpan.Parse(comboBoxTime.Text.Split("-")[0])}',TeacherId={comboBoxTeacher.Text.Split(".")[0]} where GroupName='{comboBoxGroupName.Text}' and DayOfWeek='{dataGridViewLessons.Rows[dataGridViewLessons.SelectedCells[0].RowIndex].Cells[0].Value}' and StartTime='{TimeSpan.Parse(dataGridViewLessons.Columns[dataGridViewLessons.SelectedCells[0].ColumnIndex].HeaderText.Split("-")[0])}' and SubjectName='{dataGridViewLessons.Rows[dataGridViewLessons.SelectedCells[0].RowIndex].Cells[dataGridViewLessons.SelectedCells[0].ColumnIndex].Value}'";
                var dialogresult = MessageBox.Show("Are you sure to update this lesson time", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                if (dialogresult == DialogResult.Yes)
                {
                    command.ExecuteNonQuery();
                }
            }
            GetGroupLessonTime();
        }



        private void comboBoxCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxSubject.ResetText();
            GetMajorSubjects();
            GetGroupLessonTime();
        }

        private void comboBoxSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxSubject.ResetText();
            GetMajorSubjects();
            GetGroupLessonTime();
        }

        private void comboBoxGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {

            comboBoxSubject.ResetText();
            comboBoxDayOfWeek.ResetText();
            comboBoxTime.ResetText();
            comboBoxTeacher.ResetText();
            GetMajorSubjects();
            SetCourseSemesterIndex();
            GetGroupLessonTime();

        }

        private void comboBoxSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetSubjcetTeachers();
        }

        private void dataGridViewLessons_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex > 0 && dataGridViewLessons.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
            {
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select SubjectName,DayOfWeek,StartTime,t.Id,t.Name,t.Surname,t.FatherName from GroupLessonTime g join Teacher t on g.TeacherId=T.Id where GroupName='{comboBoxGroupName.Text}' and DayOfWeek='{dataGridViewLessons.Rows[e.RowIndex].Cells[0].Value}' and StartTime='{TimeSpan.Parse(dataGridViewLessons.Columns[e.ColumnIndex].HeaderText.Split("-")[0])}' and SubjectName='{dataGridViewLessons.Rows[e.RowIndex].Cells[e.ColumnIndex].Value}'";
                    var data = command.ExecuteReader();
                    if (data.Read())
                    {
                        comboBoxSubject.Text = data.GetString(0);
                        comboBoxDayOfWeek.Text = data.GetString(1);
                        comboBoxTime.Text = data.GetTimeSpan(2).ToString().Substring(0, 5) + "-" + data.GetTimeSpan(2).Add(TimeSpan.FromHours(1)).ToString().Substring(0, 5);
                        comboBoxTeacher.Text = data.GetInt32(3) + "." + data.GetString(4) + " " + data.GetString(5) + " " + data.GetString(6);
                    }
                }
            }
            else if (e.RowIndex >= 0 && e.ColumnIndex > 0 && dataGridViewLessons.Rows[e.RowIndex].Cells[e.ColumnIndex].Value == null)
            {
                comboBoxSubject.ResetText();
                comboBoxDayOfWeek.Text = dataGridViewLessons.Rows[dataGridViewLessons.SelectedCells[0].RowIndex].Cells[0].Value.ToString();
                comboBoxTime.Text = dataGridViewLessons.Columns[dataGridViewLessons.SelectedCells[0].ColumnIndex].HeaderText;
                comboBoxTeacher.ResetText();
            }
            else
            {
                comboBoxSubject.ResetText();
                comboBoxDayOfWeek.ResetText();
                comboBoxTime.ResetText();
                comboBoxTeacher.ResetText();
            }
        }

       
    }
}
