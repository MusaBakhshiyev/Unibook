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

namespace Unibook.UnibookAdmin
{
    public partial class PageModifyStudent : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        public PageModifyStudent()
        {
            InitializeComponent();
        }
        private void PageModifyStudent_Load(object sender, EventArgs e)
        {
            GetAllStudents();
        }
        private void GetMajorGroups()
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Name from Groups where Major='{comboBoxMajor.SelectedItem}'";
                var data = command.ExecuteReader();
                comboBoxGroupName.Items.Clear();
                while (data.Read())
                {
                    comboBoxGroupName.Items.Add(data.GetString(0));
                }
            }

        }
        private void GetAllStudents()
        {
            List<Students> result = new List<Students>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "select * from Student";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    var student = new Students
                    {
                        Id = data.GetInt32("Id"),
                        Name = data.GetString("Name"),
                        Surname = data.GetString("Surname"),
                        FatherName = data.GetString("FatherName"),
                        DateOfBirth = data.GetDateTime("DateOfBirth"),
                        EntranceScore = data.GetDouble("EntranceScore"),
                        EntranceYear = data.GetInt32("EntranceYear"),
                        GraduationYear = data.GetInt32("GraduationYear"),
                        EducationForm = data.GetString("EducationForm"),
                        Major = data.GetString("Major"),
                        Department = data.GetString("Department"),
                        PaymentType = data.GetString("PaymentType"),
                        EducationDegree = data.GetString("EducationDegree"),
                        GroupName = data.GetString("GroupName"),
                        Username = data.GetString("Username"),
                        Gender = data.GetString("Gender"),
                        Password = data.GetString("Password"),
                        PhoneNumber = data.GetString("PhoneNumber"),
                        EMail = data.GetString("EMail"),
                    };
                    result.Add(student);
                }
                dataGridViewStudents.DataSource = result;
            }
            if (dataGridViewStudents.RowCount > 0)
            {
                DataGridViewRow selectedrow = (dataGridViewStudents.Rows[dataGridViewStudents.SelectedCells[0].RowIndex]);
                foreach (Control control in panelModifyStudents.Controls)
                {
                    if (control is TextBox || control is ComboBox)
                    {
                        control.Text = selectedrow.Cells[$"{(control.Name).Split("Box")[1]}"].Value.ToString();
                    }
                    else if (control is DateTimePicker)
                    {

                        ((DateTimePicker)control).Value = (DateTime)selectedrow.Cells[$"{(control.Name).Split("Picker")[1]}"].Value;
                    }
                }
                GetMajorGroups();
            }

        }
        private void buttonAdd_Click(object sender, EventArgs e)
        {
            bool groupIsFull = true;
            int YearOfGroup = DateTime.Now.Year;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Maxcount,StudentNumber,Year from Groups where Name='{comboBoxGroupName.Text}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    if (data.GetInt32(1) + 1 <= data.GetInt32(0))
                    {
                        groupIsFull = false;
                        YearOfGroup = data.GetInt32(2);
                    }
                }
            }
            if (!groupIsFull)
            {
                SqlTransaction transaction;
                using (var connection = new SqlConnection(constr))
                {
                    int year;
                    if (labelEducationDegree.Text == "Bachelor")
                    {
                        year = 4;
                    }
                    else
                    {
                        year = 2;
                    }
                    connection.Open();
                    transaction = connection.BeginTransaction();
                    var command = connection.CreateCommand();
                    var command2 = connection.CreateCommand();
                    command.CommandText = $"insert into Student values(N'{textBoxName.Text}',N'{textBoxSurname.Text}','{dateTimePickerDateOfBirth.Value}',N'{textBoxFatherName.Text}',{YearOfGroup},{YearOfGroup + year},{textBoxEntranceScore.Text},'{comboBoxMajor.Text}','{comboBoxDepartment.Text}','{comboBoxEducationForm.Text}','{comboBoxPaymentType.Text}','{comboBoxEducationDegree.Text}','{comboBoxGroupName.Text}','{textBoxPhoneNumber.Text}',N'{textBoxEMail.Text}',N'{textBoxUsername.Text}',N'{textBoxPassword.Text}','{comboBoxGender.Text}')";
                    command.Transaction = transaction;
                    command2.CommandText = $"update Groups set StudentNumber=(select StudentNumber from Groups where Name='{comboBoxGroupName.Text}')+1 where Name='{comboBoxGroupName.Text}'";
                    command2.Transaction = transaction;
                    try
                    {
                        command.ExecuteNonQuery();
                        command2.ExecuteNonQuery();
                        transaction.Commit();
                        MessageBox.Show("Student succesfully added");
                        GetAllStudents();

                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }
                }

            }
            else
            {
                MessageBox.Show("This group is already full");
            }


        }
        private void buttonClear_Click(object sender, EventArgs e)
        {

            foreach (Control control in panelModifyStudents.Controls)
            {
                if (control is TextBox || control is ComboBox || control is DateTimePicker)
                    control.ResetText();
            }

        }
        private void buttonDelete_Click(object sender, EventArgs e)
        {
            SqlTransaction transaction;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                var command = connection.CreateCommand();
                var command2 = connection.CreateCommand();
                command.CommandText = $"delete from Student where id={(dataGridViewStudents.Rows[dataGridViewStudents.SelectedCells[0].RowIndex]).Cells["Id"].Value}";
                command.Transaction = transaction;
                command2.CommandText = $"update groups set StudentNumber=(select StudentNumber from Groups where Name='{comboBoxGroupName.Text}')-1 where Name='{comboBoxGroupName.Text}'";
                command2.Transaction = transaction;
                var dialogResult = MessageBox.Show("Are you sure to delete selected student", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                if (dialogResult == DialogResult.Yes)
                {
                    try
                    {
                        command.ExecuteNonQuery();
                        command2.ExecuteNonQuery();
                        transaction.Commit();
                        GetAllStudents();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }

                }

            }
            if (dataGridViewStudents.Rows.Count == 0)
            {
                buttonClear_Click(sender, e);
            }

        }
        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            bool groupIsFull = true;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Maxcount,StudentNumber from Groups where Name='{comboBoxGroupName.Text}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    if (data.GetInt32(1) + 1 <= data.GetInt32(0))
                    {
                        groupIsFull = false;
                    }
                    else
                    {
                        MessageBox.Show("This group is already full");
                    }
                }
            }
            if (!groupIsFull)
            {
                SqlTransaction transaction;
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    transaction = connection.BeginTransaction();
                    var command = connection.CreateCommand();
                    var command2 = connection.CreateCommand();
                    var command3 = connection.CreateCommand();
                    command.Transaction = transaction;
                    command2.Transaction = transaction;
                    command3.Transaction = transaction;
                    command.CommandText = $"update Student set Name=@N, Surname=@S,FatherName=@Fn,DateOfBirth=@Dob,EntranceScore=@Es,EducationForm=@Ef,Major=@M,Department=@D,GroupName=@GN,PaymentType=@Pt,EducationDegree=@Ed,Username=@U,Password=@P,Gender=@G,PhoneNumber=@Pn,EMail=@EM where Id={(dataGridViewStudents.Rows[dataGridViewStudents.SelectedCells[0].RowIndex]).Cells["Id"].Value}";
                    command2.CommandText = $"update groups set StudentNumber=(select StudentNumber from Groups where Name='{comboBoxGroupName.Text}')+1 where Name='{comboBoxGroupName.Text}'";
                    command3.CommandText = $"update groups set StudentNumber=(select StudentNumber from Groups where Name='{(dataGridViewStudents.Rows[dataGridViewStudents.SelectedCells[0].RowIndex]).Cells["GroupName"].Value}')-1 where Name='{(dataGridViewStudents.Rows[dataGridViewStudents.SelectedCells[0].RowIndex]).Cells["GroupName"].Value}'";
                    command.Parameters.AddWithValue("@N", textBoxName.Text);
                    command.Parameters.AddWithValue("@S", textBoxSurname.Text);
                    command.Parameters.AddWithValue("@FN", textBoxFatherName.Text);
                    command.Parameters.AddWithValue("@Dob", dateTimePickerDateOfBirth.Value);
                    command.Parameters.AddWithValue("@Es", textBoxEntranceScore.Text);
                    command.Parameters.AddWithValue("@Ef", comboBoxEducationForm.Text);
                    command.Parameters.AddWithValue("@M", comboBoxMajor.Text);
                    command.Parameters.AddWithValue("@D", comboBoxDepartment.Text);
                    command.Parameters.AddWithValue("@GN", comboBoxGroupName.Text);
                    command.Parameters.AddWithValue("@Pt", comboBoxPaymentType.Text);
                    command.Parameters.AddWithValue("@Ed", comboBoxEducationDegree.Text);
                    command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                    command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                    command.Parameters.AddWithValue("@G", comboBoxGender.Text);
                    command.Parameters.AddWithValue("@Pn", textBoxPhoneNumber.Text);
                    command.Parameters.AddWithValue("@EM", textBoxEMail.Text);
                    var dialogResult = MessageBox.Show("Are you sure to update selected student", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                    if (dialogResult == DialogResult.Yes)
                    {
                        try
                        {
                            command.ExecuteNonQuery();
                            command2.ExecuteNonQuery();
                            command3.ExecuteNonQuery();
                            transaction.Commit();
                            GetAllStudents();
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            throw;
                        }

                    }
                }
            }


        }
        private void dataGridViewStudents_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow selectedrow = dataGridViewStudents.Rows[e.RowIndex];
                foreach (Control control in panelModifyStudents.Controls)
                {
                    if (control is TextBox || control is ComboBox)
                    {
                        control.Text = selectedrow.Cells[$"{(control.Name).Split("Box")[1]}"].Value.ToString();
                    }
                    else if (control is DateTimePicker)
                    {

                        ((DateTimePicker)control).Value = (DateTime)selectedrow.Cells[$"{(control.Name).Split("Picker")[1]}"].Value;
                    }
                }
            }

        }

        private void comboBoxMajor_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetMajorGroups();
        }
    }
    public class Students
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string FatherName { get; set; }
        public int EntranceYear { get; set; }
        public int GraduationYear { get; set; }
        public double EntranceScore { get; set; }
        public string Major { get; set; }
        public string Department { get; set; }
        public string EducationForm { get; set; }
        public string PaymentType { get; set; }
        public string EducationDegree { get; set; }
        public string GroupName { get; set; }
        public string PhoneNumber { get; set; }
        public string EMail { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
    }
}

