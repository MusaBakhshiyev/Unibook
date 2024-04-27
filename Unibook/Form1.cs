using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Unibook.UnibookAdmin;
using Unibook.UnibookStudent;
using Unibook.UnibookTeacher;

namespace Unibook
{
    public partial class Form1 : Form
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public Form1()
        {
            InitializeComponent();
            AcceptButton = buttonLogin;
        }

        private void Form1_ClientSizeChanged(object sender, EventArgs e)
        {
            if (panelLogin2.Width < 700)
            {
                pictureBoxLogin2.Size = new Size(panelLogin2.Width, panelLogin2.Height - 105);
            }
            else
            {
                pictureBoxLogin2.Size = new Size(panelLogin2.Width - 125, panelLogin2.Height - 105);
            }

            pictureBoxLogin2.Location = new Point((panelLogin2.Width - pictureBoxLogin2.Width) / 2, (panelLogin2.Height - pictureBoxLogin2.Height) / 2);
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            if (textBoxUsername.Text == "admin" && textBoxPassword.Text == "123")
            {
                AdminPageFirst admin = new AdminPageFirst();
                admin.Dock = DockStyle.Fill;
                panelMain.Controls.Clear();
                panelMain.Controls.Add(admin);
            }
            else
            {
                string user = "";
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select Name from Student where Username=@U and Password=@P";
                    command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                    command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                    var data = command.ExecuteReader();
                    if (data.HasRows)
                    {
                        user = "Student";
                    }
                }
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"select Name from Teacher where Username=@U and Password=@P";
                    command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                    command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                    var data = command.ExecuteReader();
                    if (data.HasRows)
                    {
                        user = "Teacher";
                    }
                }
                if (user == "Student")
                {
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select * from Student where Username=@U and Password=@P";
                        command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                        command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                        var data = command.ExecuteReader();
                        if (data.Read())
                        {
                            StudentLogin.Name = data.GetString(1);
                            StudentLogin.Surname = data.GetString(2);
                            StudentLogin.DateOfBirth = data.GetDateTime(3);
                            StudentLogin.FatherName = data.GetString(4);
                            StudentLogin.EntranceYear = data.GetInt32(5);
                            StudentLogin.GraduationYear = data.GetInt32(6);
                            StudentLogin.EntranceScore = data.GetDouble(7);
                            StudentLogin.Major = data.GetString(8);
                            StudentLogin.Department = data.GetString(9);
                            StudentLogin.EducationForm = data.GetString(10);
                            StudentLogin.PaymentType = data.GetString(11);
                            StudentLogin.EducationDegree = data.GetString(12);
                            StudentLogin.GroupName = data.GetString(13);
                            StudentLogin.PhoneNumber = data.GetString(14);
                            StudentLogin.EMail = data.GetString(15);
                            StudentLogin.Username = data.GetString(16);
                            StudentLogin.Password = data.GetString(17);
                            StudentLogin.Gender = data.GetString(18);
                            StudentMainPage student = new StudentMainPage();
                            student.Dock = DockStyle.Fill;
                            panelMain.Controls.Clear();
                            panelMain.Controls.Add(student);
                        }

                    }
                }
                else if (user == "Teacher")
                {
                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"select * from Teacher where Username=@U and Password=@P";
                        command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                        command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                        var data = command.ExecuteReader();
                        if (data.Read())
                        {
                            TeacherLogin.Id = data.GetInt32(0);
                            TeacherLogin.Name = data.GetString(1);
                            TeacherLogin.Surname = data.GetString(2);
                            TeacherLogin.FatherName = data.GetString(3);
                            TeacherLogin.DateOfBirth = data.GetDateTime(4);
                            TeacherLogin.Username = data.GetString(5);
                            TeacherLogin.Password = data.GetString(6);
                            TeacherLogin.PhoneNumber = data.GetString(7);
                            TeacherLogin.EMail = data.GetString(8);
                            TeacherLogin.Gender = data.GetString(9);
                            TeacherMainPage teacher = new TeacherMainPage();
                            teacher.Dock = DockStyle.Fill;
                            panelMain.Controls.Clear();
                            panelMain.Controls.Add(teacher);
                        }

                    }
                }
                else
                {
                    MessageBox.Show("There is no such user");
                }

            }

        }

        private void buttonLogin_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                buttonLogin_Click(this, default);
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void pictureBoxHide_Click(object sender, EventArgs e)
        {
            textBoxPassword.UseSystemPasswordChar = false;
            pictureBoxShow.Visible = true;
        }

        private void pictureBoxShow_Click(object sender, EventArgs e)
        {
            textBoxPassword.UseSystemPasswordChar = true;
            pictureBoxShow.Visible = false;
        }

        private void pictureBoxShow_MouseEnter(object sender, EventArgs e)
        {
            pictureBoxShow.BackColor = Color.Gainsboro;
        }

        private void pictureBoxShow_MouseLeave(object sender, EventArgs e)
        {
            pictureBoxShow.BackColor = Color.Transparent;
        }

        private void pictureBoxHide_MouseEnter(object sender, EventArgs e)
        {
            pictureBoxHide.BackColor = Color.Gainsboro;
        }

        private void pictureBoxHide_MouseLeave(object sender, EventArgs e)
        {
            pictureBoxHide.BackColor = Color.Transparent;
        }
    }
    public class StudentLogin
    {
        public static string Name { get; set; }
        public static string Surname { get; set; }
        public static DateTime DateOfBirth { get; set; }
        public static string FatherName { get; set; }
        public static int EntranceYear { get; set; }
        public static int GraduationYear { get; set; }
        public static double EntranceScore { get; set; }
        public static string Major { get; set; }
        public static string Department { get; set; }
        public static string EducationForm { get; set; }
        public static string PaymentType { get; set; }
        public static string EducationDegree { get; set; }
        public static string GroupName { get; set; }
        public static string PhoneNumber { get; set; }
        public static string EMail { get; set; }
        public static string Username { get; set; }
        public static string Password { get; set; }
        public static string Gender { get; set; }
    }
    public class TeacherLogin
    {
        public static int Id { get; set; }
        public static string Name { get; set; }
        public static string Surname { get; set; }
        public static DateTime DateOfBirth { get; set; }
        public static string FatherName { get; set; }
        public static string PhoneNumber { get; set; }
        public static string EMail { get; set; }
        public static string Username { get; set; }
        public static string Password { get; set; }
        public static string Gender { get; set; }
    }

}
