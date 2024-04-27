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
    public partial class PageInformation : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageInformation()
        {
            InitializeComponent();
            labelFullName.Text = StudentLogin.Name + " " + StudentLogin.Surname;
            labelDateOfBirth.Text = StudentLogin.DateOfBirth.ToShortDateString();
            labelFatherName.Text = StudentLogin.FatherName;
            labelEntranceYear.Text = StudentLogin.EntranceYear.ToString();
            labelEntranceScore.Text = StudentLogin.EntranceScore.ToString();
            labelMajor.Text = StudentLogin.Major;
            labelDepartment.Text = StudentLogin.Department;
            labelEducationForm.Text = StudentLogin.EducationForm;
            labelEducationDegree.Text = StudentLogin.EducationDegree;
            labelPaymentType.Text = StudentLogin.PaymentType;
            labelGroupName.Text = StudentLogin.GroupName;
            labelPhoneNumber.Text = StudentLogin.PhoneNumber;
            labelUsername.Text = StudentLogin.Username;
            labelPassword.Text = StudentLogin.Password;
            labelEMail.Text = StudentLogin.EMail;
            labelGender.Text = StudentLogin.Gender;

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
                        command.CommandText = $"update student set password = N'{textBoxNewPassword.Text}' where Name=N'{StudentLogin.Name}' and Surname = N'{StudentLogin.Surname}' and FatherName=N'{StudentLogin.FatherName}'";
                        command.ExecuteNonQuery();
                        StudentLogin.Password = textBoxNewPassword.Text;
                        labelPassword.Text = StudentLogin.Password;
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
                MessageBox.Show("You should enter new password and confirm new password","",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }

        }
    }
}
