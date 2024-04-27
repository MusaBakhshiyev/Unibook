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
    public partial class PageModifyTeacher : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        public PageModifyTeacher()
        {
            InitializeComponent();
        }
        private void PageModifyTeacher_Load(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "select name from Subjects";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    checkedListBoxSubjects.Items.Add(data.GetString(0));
                }
            }
            GetAllTeachers();
        }
        private void GetTeacherSubjects()
        {
            List<string> result = new List<string>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select s.Name from TeacherSubjects t join Subjects s on t.SubjectId=s.Id where t.TeacherId={(dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex]).Cells["Id"].Value.ToString()}";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    result.Add(data.GetString(0));
                }
                foreach (int index in checkedListBoxSubjects.CheckedIndices)
                {
                    checkedListBoxSubjects.SetItemChecked(index, false);
                }
                dataGridViewTeacherSubjects.Rows.Clear();
                foreach (var subject in result)
                {
                    dataGridViewTeacherSubjects.Rows.Add(subject);
                    checkedListBoxSubjects.SetItemChecked(checkedListBoxSubjects.FindStringExact(subject), true);
                }

            }
        }
        private void GetAllTeachers()
        {
            List<Teacher> result = new List<Teacher>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "select * from Teacher";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    var teacher = new Teacher
                    {
                        Id = data.GetInt32("Id"),
                        Name = data.GetString("Name"),
                        Surname = data.GetString("Surname"),
                        FatherName = data.GetString("FatherName"),
                        DateOfBirth = data.GetDateTime("DateOfBirth"),
                        Username = data.GetString("Username"),
                        Gender = data.GetString("Gender"),
                        Password = data.GetString("Password"),
                        PhoneNumber = data.GetString("PhoneNumber"),
                        EMail = data.GetString("EMail"),
                    };
                    result.Add(teacher);
                }
                dataGridViewTeachers.DataSource = result;
            }
            if (dataGridViewTeachers.RowCount > 0)
            {
                DataGridViewRow selectedrow = dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex];
                foreach (Control test in panelModifyTeachers.Controls)
                {
                    if (test is TextBox || test is ComboBox)
                    {
                        test.Text = selectedrow.Cells[$"{(test.Name).Split("Box")[1]}"].Value.ToString();
                    }
                    else if (test is DateTimePicker)
                    {

                        ((DateTimePicker)test).Value = (DateTime)selectedrow.Cells[$"{(test.Name).Split("Picker")[1]}"].Value;
                    }
                }
                GetTeacherSubjects();
            }

        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            SqlTransaction transaction;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                transaction = connection.BeginTransaction();
                var command = connection.CreateCommand();
                var command2 = connection.CreateCommand();
                command.CommandText = $"insert into Teacher values(N'{textBoxName.Text}',N'{textBoxSurname.Text}',N'{textBoxFatherName.Text}','{dateTimePickerDateOfBirth.Value}',N'{textBoxUsername.Text}',N'{textBoxPassword.Text}','{textBoxPhoneNumber.Text}',N'{textBoxEMail.Text}','{comboBoxGender.Text}')";
                command.Transaction = transaction;
                command2.Transaction = transaction;
                try
                {
                    command.ExecuteNonQuery();
                    foreach (var item in checkedListBoxSubjects.CheckedItems)
                    {
                        command2.CommandText = $"insert into TeacherSubjects values((select top 1 Id from Teacher order by Id desc),(select Id from Subjects where Name='{item}'))";
                        command2.ExecuteNonQuery();
                    }
                    transaction.Commit();
                    MessageBox.Show("Teacher succesfully added");
                    GetAllTeachers();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }

            }
        }

        private void buttonClear_Click(object sender, EventArgs e)
        {
            foreach (Control control in panelModifyTeachers.Controls)
            {
                if (control is TextBox || control is ComboBox || control is DateTimePicker)
                {
                    control.ResetText();
                }
                foreach (int index in checkedListBoxSubjects.CheckedIndices)
                {
                    checkedListBoxSubjects.SetItemChecked(index, false);
                }

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
                command.Transaction = transaction;
                command2.Transaction = transaction;
                command.CommandText = $"delete from Teacher where id={(dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex]).Cells["Id"].Value}";
                command2.CommandText = $"delete from TeacherSubjects where TeacherId={(dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex]).Cells["Id"].Value}";
                var dialogResult = MessageBox.Show("Are you sure to delete selected student", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);
                if (dialogResult == DialogResult.Yes)
                {
                    try
                    {
                        command.ExecuteNonQuery();
                        command2.ExecuteNonQuery();
                        transaction.Commit();
                        GetAllTeachers();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }

                }

            }
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
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
                command.CommandText = $"update Teacher set Name=@N, Surname=@S,FatherName=@Fn,DateOfBirth=@Dob,Username=@U,Password=@P,Gender=@G,PhoneNumber=@Pn,EMail=@EM where Id=@Id";
                command3.CommandText = $"delete from TeacherSubjects where TeacherId={(dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex]).Cells["Id"].Value}";
                command.Parameters.AddWithValue("@N", textBoxName.Text);
                command.Parameters.AddWithValue("@S", textBoxSurname.Text);
                command.Parameters.AddWithValue("@FN", textBoxFatherName.Text);
                command.Parameters.AddWithValue("@Dob", dateTimePickerDateOfBirth.Value);
                command.Parameters.AddWithValue("@U", textBoxUsername.Text);
                command.Parameters.AddWithValue("@P", textBoxPassword.Text);
                command.Parameters.AddWithValue("@G", comboBoxGender.Text);
                command.Parameters.AddWithValue("@Pn", textBoxPhoneNumber.Text);
                command.Parameters.AddWithValue("@EM", textBoxEMail.Text);
                command.Parameters.AddWithValue("@Id", (dataGridViewTeachers.Rows[dataGridViewTeachers.SelectedCells[0].RowIndex]).Cells["Id"].Value);
                var dialogResult = MessageBox.Show("Are you sure to update selected teacher", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);
                if (dialogResult == DialogResult.Yes)
                {
                    try
                    {
                        command.ExecuteNonQuery();
                        command3.ExecuteNonQuery();
                        foreach (var item in checkedListBoxSubjects.CheckedItems)
                        {
                            command2.CommandText = $"insert into TeacherSubjects values((select top 1 Id from Teacher order by Id desc),(select Id from Subjects where Name='{item}'))";
                            command2.ExecuteNonQuery();
                        }
                        transaction.Commit();
                        GetAllTeachers();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }

                }
            }
        }

        private void dataGridViewTeachers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow selectedrow = dataGridViewTeachers.Rows[e.RowIndex];
                foreach (Control control in panelModifyTeachers.Controls)
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
                GetTeacherSubjects();
            }


        }
    }
    public class Teacher
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string FatherName { get; set; }
        public string PhoneNumber { get; set; }
        public string EMail { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
    }

}
