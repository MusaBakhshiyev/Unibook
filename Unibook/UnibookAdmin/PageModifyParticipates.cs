using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace Unibook.UnibookAdmin
{
    public partial class PageModifyParticipates : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        List<DateTime> allDateTimes = new List<DateTime>();
        int index;
        public PageModifyParticipates()
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
            comboBoxGroupName.SelectedIndexChanged -= comboBoxGroupName_SelectedIndexChanged;
            comboBoxGroupName.SelectedIndex = 0;
            comboBoxGroupName.SelectedIndexChanged += comboBoxGroupName_SelectedIndexChanged;
            SetCourseSemesterIndex();
            GetMajorSubjects();
            subjectParticipatesShow();
            RandomParticipate();
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
        private void GetSubjectParticipates()
        {
            dataGridViewParticipates.Visible = false;
            buttonBack.Visible = false;
            buttonNext.Visible = false;
            if (subjectParticipatesShow())
            {
                dataGridViewParticipates.Visible = true;
                buttonBack.Visible = true;
                buttonNext.Visible = true;
                dataGridViewParticipates.Columns.Clear();
                dataGridViewParticipates.Columns.Add("Students", "Students");
                GetGroupStudents();
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
                for (int i = 1; i < dataGridViewParticipates.ColumnCount; i++)
                {
                    for (int j = 0; j < dataGridViewParticipates.RowCount; j++)
                    {
                        dataGridViewParticipates.Columns[i].Width = 110;
                        DataGridViewComboBoxCell comboBoxCell = new DataGridViewComboBoxCell();
                        comboBoxCell.FlatStyle = FlatStyle.Flat;
                        comboBoxCell.Items.Add("PARTICIPATE");
                        comboBoxCell.Items.Add("ABSENT");
                        comboBoxCell.Style.Font = new Font("Segoe UI", 8, FontStyle.Bold);
                        comboBoxCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                        dataGridViewParticipates[i, j] = comboBoxCell;

                    }
                }
                GetStudentParticipation();
            }

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
                    command.CommandText = $"select Year,DayOfWeek,StartTime from GroupLessonTime gl join Groups g on gl.GroupName=g.Name where GroupName='{comboBoxGroupName.SelectedItem}' and SubjectName='{comboBoxSubject.SelectedItem}'";
                    var data = command.ExecuteReader();
                    DateTime date = default;
                    while (data.Read())
                    {
                        if (comboBoxSemester.Text == "Autumn")
                        {
                            date = new DateTime(data.GetInt32(0) - Convert.ToInt32(comboBoxCourse.SelectedItem) + 1, 9, 15, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
                        }
                        else
                        {
                            date = new DateTime(data.GetInt32(0) - Convert.ToInt32(comboBoxCourse.SelectedItem) + 2, 2, 16, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
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
                        lastDay = new DateTime(date.Year+1,2,15);
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
                for (int j = 0; j < dataGridViewParticipates.RowCount; j++)
                {
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select Participation from Participation where GroupName ='{comboBoxGroupName.Text}' and SubjectName='{comboBoxSubject.Text}' and StudentName=N'{dataGridViewParticipates[0, j].Value}' and  Date = '{allDateTimes[(index / 7) * 7 + i - 1]}'";
                        var data = command.ExecuteReader();
                        if (data.Read())
                        {
                            DataGridViewComboBoxCell comboBoxCell = dataGridViewParticipates[i, j] as DataGridViewComboBoxCell;
                            comboBoxCell.Value = data.GetString(0);
                            if (data.GetString(0) == "PARTICIPATE")
                            {
                                dataGridViewParticipates[i, j].Style.BackColor = Color.Blue;
                            }
                            else
                            {
                                dataGridViewParticipates[i, j].Style.BackColor = Color.Red;
                            }

                            dataGridViewParticipates[i, j].Style.ForeColor = Color.White;
                        }
                    }
                }

            }

        }
        private void GetGroupStudents()
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Name,Surname,FatherName from Student where GroupName='{comboBoxGroupName.SelectedItem}'";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    dataGridViewParticipates.Rows.Add(data.GetString(0) + " " + data.GetString(1) + " " + data.GetString(2));
                }
            }
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
            comboBoxSubject.SelectedIndex = 0;
        }

        private void comboBoxGroupName_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataGridViewParticipates.Columns.Clear();
            dataGridViewParticipates.Rows.Clear();
            comboBoxSubject.ResetText();
            GetMajorSubjects();
            SetCourseSemesterIndex();
            RandomParticipate();
        }

        private void comboBoxSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            RandomParticipate();
        }

        private void comboBoxCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxSubject.ResetText();
            GetMajorSubjects();
            RandomParticipate();
        }

        private void comboBoxSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxSubject.ResetText();
            GetMajorSubjects();
            RandomParticipate();
        }
        private void AfterEditCell(int i, int j)
        {
            int columnIndex = i;
            int rowIndex = j;
            DataGridViewComboBoxCell comboBoxCell = dataGridViewParticipates[columnIndex, rowIndex] as DataGridViewComboBoxCell;
            if (comboBoxCell.Value != null)
            {
                string selectedItem = comboBoxCell.Value.ToString();

                if (selectedItem == "PARTICIPATE")
                {
                    dataGridViewParticipates[columnIndex, rowIndex].Style.BackColor = Color.Blue;
                    dataGridViewParticipates[columnIndex, rowIndex].Style.ForeColor = Color.White;
                }
                else if (selectedItem == "ABSENT")
                {
                    dataGridViewParticipates[columnIndex, rowIndex].Style.BackColor = Color.Red;
                    dataGridViewParticipates[columnIndex, rowIndex].Style.ForeColor = Color.White;

                }
                if (comboBoxCell.Value != null)
                {
                    bool HasRows = false;
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select StudentName from participation where GroupName=@GN and SubjectName=@SN and StudentName=@StN and Date=@D";
                        command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                        command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[rowIndex].Cells[0].Value);
                        command.Parameters.AddWithValue("@D", allDateTimes[(index / 7) * 7 + columnIndex - 1]);
                        var data = command.ExecuteReader();
                        if (data.HasRows)
                        {
                            HasRows = true;
                        }
                    }
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        var command2 = connection.CreateCommand();
                        command.CommandText = $"insert into participation values (@GN,@SN,@StN,@P,@D)";
                        command2.CommandText = $"update Participation set Participation = @P where GroupName=@GN and SubjectName=@SN and StudentName=@StN and Date=@D";
                        command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                        command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[rowIndex].Cells[0].Value);
                        command.Parameters.AddWithValue("@P", comboBoxCell.Value);
                        command.Parameters.AddWithValue("@D", allDateTimes[(index / 7) * 7 + columnIndex - 1]);

                        command2.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                        command2.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command2.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[rowIndex].Cells[0].Value);
                        command2.Parameters.AddWithValue("@P", comboBoxCell.Value);
                        command2.Parameters.AddWithValue("@D", allDateTimes[(index / 7) * 7 + columnIndex - 1]);

                        if (HasRows)
                        {
                            command2.ExecuteNonQuery();
                        }
                        else
                        {
                            command.ExecuteNonQuery();
                        }
                    }

                }

            }
        }
        private void dataGridViewParticipates_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {

            if (e.ColumnIndex > 0 && e.RowIndex >= 0)
            {
                AfterEditCell(e.ColumnIndex, e.RowIndex);
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

            for (int i = 1; i < dataGridViewParticipates.ColumnCount; i++)
            {
                for (int j = 0; j < dataGridViewParticipates.RowCount; j++)
                {
                    dataGridViewParticipates.Columns[i].Width = 110;
                    DataGridViewComboBoxCell comboBoxCell = new DataGridViewComboBoxCell();
                    comboBoxCell.FlatStyle = FlatStyle.Flat;
                    comboBoxCell.Items.Add("PARTICIPATE");
                    comboBoxCell.Items.Add("ABSENT");
                    comboBoxCell.Style.Font = new Font("Segoe UI", 8, FontStyle.Bold);
                    comboBoxCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                    dataGridViewParticipates[i, j] = comboBoxCell;
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
            for (int i = 1; i < dataGridViewParticipates.ColumnCount; i++)
            {
                for (int j = 0; j < dataGridViewParticipates.RowCount; j++)
                {
                    dataGridViewParticipates.Columns[i].Width = 110;
                    DataGridViewComboBoxCell comboBoxCell = new DataGridViewComboBoxCell();
                    comboBoxCell.FlatStyle = FlatStyle.Flat;
                    comboBoxCell.Items.Add("PARTICIPATE");
                    comboBoxCell.Items.Add("ABSENT");
                    comboBoxCell.Style.Font = new Font("Segoe UI", 8, FontStyle.Bold);
                    comboBoxCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                    dataGridViewParticipates[i, j] = comboBoxCell;

                }
            }
            GetStudentParticipation();

        }

        private void RandomParticipate()
        {
            GetLessonAllTimes();
            foreach (DateTime times in allDateTimes)
            {
                if (times.AddHours(1) > DateTime.Now)
                {
                    break;
                }

                for (int i = 0; i < dataGridViewParticipates.RowCount; i++)
                {


                    using (var connection1 = new SqlConnection(constr))
                    {
                        connection1.Open();
                        var command1 = connection1.CreateCommand();
                        command1.CommandText = $"select StudentName from participation where GroupName=@GN and SubjectName=@SN and StudentName=@StN and Date=@D";
                        command1.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                        command1.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                        command1.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[i].Cells[0].Value);
                        command1.Parameters.AddWithValue("@D", times);
                        var data = command1.ExecuteReader();
                        if (!data.HasRows)
                        {
                            using (var connection = new SqlConnection(constr))
                            {
                                Random random = new Random();
                                string p;
                                int r = random.Next(0, 20);
                                if (r >= 0 && r <= 18)
                                {
                                    p = "PARTICIPATE";
                                }
                                else
                                {
                                    p = "ABSENT";
                                }
                                connection.Open();
                                var command = connection.CreateCommand();
                                command.CommandText = $"insert into participation values (@GN,@SN,@StN,@P,@D)";
                                command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                                command.Parameters.AddWithValue("@SN", comboBoxSubject.Text);
                                command.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[i].Cells[0].Value);
                                command.Parameters.AddWithValue("@P", p);
                                command.Parameters.AddWithValue("@D", times);
                                command.ExecuteNonQuery();
                            }
                        }

                    }

                }

            }
            GetSubjectParticipates();

        }
    }
}
