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
    public partial class PageModifyParticipation : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        List<DateTime> allDateTimes = new List<DateTime>();
        List<int> indexes;
        string GroupName;
        string Subject;
        string Major;
        int index;
        public PageModifyParticipation(string GroupName, string Subject)
        {
            InitializeComponent();
            this.GroupName = GroupName;
            this.Subject = Subject;
            indexes = GetCourseSemesterIndex();
            GetLessonAllTimes();
            GetSubjectParticipates();
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
        private void GetSubjectParticipates()
        {
            dataGridViewParticipates.Visible = false;
            buttonBack.Visible = false;
            buttonNext.Visible = false;

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
                        command.CommandText = $"select Participation from Participation where GroupName ='{GroupName}' and SubjectName='{Subject}' and StudentName=N'{dataGridViewParticipates[0, j].Value}' and  Date = '{allDateTimes[(index / 7) * 7 + i - 1]}'";
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
                command.CommandText = $"select Name,Surname,FatherName from Student where GroupName='{GroupName}'";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    dataGridViewParticipates.Rows.Add(data.GetString(0) + " " + data.GetString(1) + " " + data.GetString(2));
                }
            }
        }
        private void GetLessonAllTimes()
        {
            List<DateTime> dateTimes = new List<DateTime>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Year,DayOfWeek,StartTime from GroupLessonTime gl join Groups g on gl.GroupName=g.Name where GroupName='{GroupName}' and SubjectName='{Subject}'";
                var data = command.ExecuteReader();
                DateTime date = default;
                while (data.Read())
                {
                    if (indexes[1] == 0)
                    {
                        date = new DateTime(data.GetInt32(0) - Convert.ToInt32(indexes[0]) + 1, 9, 15, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
                    }
                    else
                    {
                        date = new DateTime(data.GetInt32(0) - Convert.ToInt32(indexes[0]) + 2, 2, 16, int.Parse(data.GetTimeSpan(2).ToString().Substring(0, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(3, 2)), int.Parse(data.GetTimeSpan(2).ToString().Substring(6, 2)));
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
                if (indexes[1] == 0)
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
                        command.Parameters.AddWithValue("@GN", GroupName);
                        command.Parameters.AddWithValue("@SN", Subject);
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
                        command.Parameters.AddWithValue("@GN", GroupName);
                        command.Parameters.AddWithValue("@SN", Subject);
                        command.Parameters.AddWithValue("@StN", dataGridViewParticipates.Rows[rowIndex].Cells[0].Value);
                        command.Parameters.AddWithValue("@P", comboBoxCell.Value);
                        command.Parameters.AddWithValue("@D", allDateTimes[(index / 7) * 7 + columnIndex - 1]);

                        command2.Parameters.AddWithValue("@GN", GroupName);
                        command2.Parameters.AddWithValue("@SN", Subject);
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

        private void dataGridViewParticipates_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            dataGridViewParticipates[e.ColumnIndex, e.RowIndex].ReadOnly = false;
            index = (index / 7) * 7;
            if (!(DateTime.Now >= allDateTimes[index + e.ColumnIndex - 1] && DateTime.Now <= allDateTimes[index + e.ColumnIndex - 1].AddHours(1)))
            {
                dataGridViewParticipates[e.ColumnIndex, e.RowIndex].ReadOnly = true;
            }
        }
    }
}

