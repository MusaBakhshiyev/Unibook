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
    public partial class PageInformation : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageInformation()
        {
            InitializeComponent();
            labelFullName.Text = TeacherLogin.Name + " " + TeacherLogin.Surname;
            labelDateOfBirth.Text = TeacherLogin.DateOfBirth.ToShortDateString();
            labelFatherName.Text = TeacherLogin.FatherName;
            labelPhoneNumber.Text = TeacherLogin.PhoneNumber;
            labelUsername.Text = TeacherLogin.Username;
            labelPassword.Text = TeacherLogin.Password;
            labelEMail.Text = TeacherLogin.EMail;
            labelGender.Text = TeacherLogin.Gender;

            listBoxSubjects.Items.Add("");
            listBoxSubjects.Items.Add("");

            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select s.Name from TeacherSubjects ts join Teacher t on ts.TeacherId=T.Id join Subjects s on ts.SubjectId=s.Id where ts.TeacherId={TeacherLogin.Id}";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    listBoxSubjects.Items.Add(data.GetString(0));
                }
            }
        }
        private void buttonChangePassword_Click(object sender, EventArgs e)
        {
            if (textBoxConfirmNewPassword.Text != "" && textBoxNewPassword.Text != "")
            {
                if (textBoxConfirmNewPassword.Text == textBoxNewPassword.Text)
                {

                    using (var connection = new SqlConnection(constr))
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = $"update Teacher set password = N'{textBoxNewPassword.Text}' where Name=N'{TeacherLogin.Name}' and Surname = N'{TeacherLogin.Surname}' and FatherName=N'{TeacherLogin.FatherName}'";
                        command.ExecuteNonQuery();
                        TeacherLogin.Password = textBoxNewPassword.Text;
                        labelPassword.Text = TeacherLogin.Password;
                        textBoxNewPassword.ResetText();
                        textBoxConfirmNewPassword.ResetText();
                    }
                }
                else
                {
                    MessageBox.Show("You should confirm new password", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
            }
            else
            {
                MessageBox.Show("You should enter new password and confirm new password", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

        }

    }
}
