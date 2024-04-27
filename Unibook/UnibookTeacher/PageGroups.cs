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
    public partial class PageGroups : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        private string SubjectName;
        private string GroupName;
        private string Major;

        public PageGroups()
        {
            InitializeComponent();
            GetGroups();
        }
        private void GetGroups()
        {
            using (var connection = new SqlConnection(constr))
            {
                int course = 1;
                int semester = 0;
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select distinct glt.SubjectName,g.Major,g.Year,glt.GroupName from GroupLessonTime glt join Groups g on glt.GroupName=g.Name where glt.TeacherId={TeacherLogin.Id}";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    SubjectName = data.GetString(0);
                    Major = data.GetString(1);
                    List<int> index = GetCourseSemesterIndex();
                    course = index[0];
                    semester = index[1];
                    if (semester == 0)
                    {
                        if (new DateTime(data.GetInt32(2) + course - 1, 9, 15) <= DateTime.Now && new DateTime(data.GetInt32(2) + course, 2, 15) >= DateTime.Now)
                        {
                            Button button = new Button();
                            button.Dock = DockStyle.Left;
                            button.FlatStyle = FlatStyle.Flat;
                            button.FlatAppearance.BorderSize = 0;
                            button.ForeColor = Color.White;
                            button.Font = new Font("Times New Roman", 16, FontStyle.Bold);
                            button.BackColor = Color.LightSteelBlue;
                            button.Size = new Size(250, 90);
                            button.Text = data.GetString(3);
                            Label label = new Label();
                            label.Size = new Size(250, 20);
                            label.Text = data.GetString(0);
                            label.TextAlign = ContentAlignment.MiddleLeft;
                            label.Font = new Font("Times New Roman", 11, FontStyle.Bold);
                            label.ForeColor = Color.White;
                            button.Controls.Add(label);
                            label.Location = new Point(button.Left, button.Bottom - label.Height);
                            panelGroups.Controls.Add(button);
                        }
                    }
                    else
                    {
                        if (new DateTime(data.GetInt32(2) + course, 2, 16) <= DateTime.Now && new DateTime(data.GetInt32(2) + course, 7, 15) >= DateTime.Now)
                        {
                            Button button = new Button();
                            button.Dock = DockStyle.Left;
                            button.FlatStyle = FlatStyle.Flat;
                            button.FlatAppearance.BorderSize = 0;
                            button.ForeColor = Color.White;
                            button.Font = new Font("Times New Roman", 16, FontStyle.Bold);
                            button.BackColor = Color.LightSteelBlue;
                            button.Size = new Size(250, 90);
                            button.Text = data.GetString(3);
                            Label label = new Label();
                            label.Size = new Size(250, 20);
                            label.Text = data.GetString(0);
                            label.TextAlign = ContentAlignment.MiddleLeft;
                            label.Font = new Font("Times New Roman", 11, FontStyle.Bold);
                            label.ForeColor = Color.White;
                            button.Controls.Add(label);
                            label.Location = new Point(button.Left, button.Bottom - label.Height);
                            panelGroups.Controls.Add(button);
                        }
                    }
                }
            }
        }

        private void EventHandler()
        {
            foreach (Control control in panelGroups.Controls)
            {
                if (control is Button)
                {
                    Button button = control as Button;
                    control.Click += ButtonGroups_Click;
                }
            }
        }
        private void ButtonGroups_Click(object sender, EventArgs e)
        {
            panelOption.Visible = true;
            panelMain.Controls.Clear();
            GroupName = (sender as Button).Text;
            foreach (Control control in (sender as Button).Controls)
            {
                if (control is Label)
                {
                    SubjectName = (control as Label).Text;
                }
            }
        }
        private List<int> GetCourseSemesterIndex()
        {
            int course = 1;
            int semester = 0;
            using (var connection = new SqlConnection(constr))
            {

                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Course,Semester from SubjectInfo si join Subjects s on si.SubjectId=s.Id where s.Name='{SubjectName}' and si.Major='{Major}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    course = data.GetInt32(0);
                    if (data.GetString(1) == "Spring")
                    {
                        semester = 1;
                    }

                }
                return new List<int> { course, semester };
            }
        }

        private void buttonParticipation_Click(object sender, EventArgs e)
        {
            PageModifyParticipation pageModifyParticipation = new PageModifyParticipation(GroupName, SubjectName);
            pageModifyParticipation.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageModifyParticipation);
        }

        private void panelGroups_ControlAdded(object sender, ControlEventArgs e)
        {
            EventHandler();
        }

        private void buttonGrades_Click(object sender, EventArgs e)
        {
            PageModifyGrades pageModifyGrades = new PageModifyGrades(GroupName, SubjectName);
            pageModifyGrades.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageModifyGrades);
        }

        private void buttonLessonTime_Click(object sender, EventArgs e)
        {
            PageLessonTime pageLessonTime = new PageLessonTime(GroupName, SubjectName);
            pageLessonTime.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageLessonTime);
        }
    }
}
