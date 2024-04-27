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
    public partial class PageModifyGroup : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageModifyGroup()
        {
            InitializeComponent();
        }
        private void PageModifyGroup_Load(object sender, EventArgs e)
        {
            GetAllGroups();
        }
        private void GetGroupStudents()
        {
            List<Students> result2 = new List<Students>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select * from Student where GroupName='{(dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex]).Cells["Name"].Value}'";
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
                    result2.Add(student);


                }
                dataGridViewStudents.DataSource = result2;
            }
        }
        private void GetAllGroups()
        {
            List<Group> result = new List<Group>();
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "select * from Groups";
                var data = command.ExecuteReader();
                while (data.Read())
                {
                    var group = new Group
                    {
                        Name = data.GetString("Name"),
                        Major = data.GetString("Major"),
                        Department = data.GetString("Department"),
                        MaxCount = data.GetInt32("MaxCount"),
                        StudentNumber = data.GetInt32("StudentNumber"),
                        Year = data.GetInt32("Year")
                    };
                    result.Add(group);
                }
                dataGridViewGroups.DataSource = result;
            }
            if (dataGridViewGroups.RowCount > 0)
            {
                foreach (Control control in panelModifyGroups.Controls)
                {
                    if (control is TextBox || control is ComboBox)
                    {
                        control.Text = (dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex]).Cells[$"{(control.Name).Split("Box")[1]}"].Value.ToString();
                    }
                }
                GetGroupStudents();
            }

        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"insert into Groups values(N'{textBoxName.Text}','{comboBoxMajor.Text}','{comboBoxDepartment.Text}','{textBoxMaxCount.Text}',{textBoxYear.Text},0)";
                command.ExecuteNonQuery();
                MessageBox.Show("Group succesfully added");
                GetAllGroups();
            }
        }

        private void buttonClear_Click(object sender, EventArgs e)
        {
            foreach (Control control in panelModifyGroups.Controls)
            {
                if (control is TextBox || control is ComboBox || control is DateTimePicker)
                    control.ResetText();
            }
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            bool groupHasStudent = true;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select StudentNumber from Groups where Name='{dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex].Cells["Name"].Value}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    if (data.GetInt32(0) != 0)
                    {
                        groupHasStudent = false;
                    }
                }
            }
            if (!groupHasStudent)
            {
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"delete from Groups where name='{(dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex]).Cells["Name"].Value}'";
                    var dialogResult = MessageBox.Show("Are you sure to delete selected group", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                    if (dialogResult == DialogResult.Yes)
                    {
                        command.ExecuteNonQuery();
                        GetAllGroups();
                    }
                }
            }
            else
            {
                MessageBox.Show("This group has students");
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
                command.CommandText = $"update Groups set Name=@N,Major=@M,Department=@D,MaxCount=@MC,Year=@Y where Name='{(dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex]).Cells["Name"].Value}'";
                command2.CommandText = $"update Student set GroupName='{textBoxName.Text}',EntranceYear={textBoxYear.Text},GraduationYear={textBoxYear.Text}+4 where GroupName='{dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex].Cells["Name"].Value}'";
                command3.CommandText = $"update GroupLessonTime set GroupName='{textBoxName.Text}' where GroupName='{dataGridViewGroups.Rows[dataGridViewGroups.SelectedCells[0].RowIndex].Cells["Name"].Value}'";
                command.Parameters.AddWithValue("@N", textBoxName.Text);
                command.Parameters.AddWithValue("@M", comboBoxMajor.Text);
                command.Parameters.AddWithValue("@D", comboBoxDepartment.Text);
                command.Parameters.AddWithValue("@MC", textBoxMaxCount.Text);
                command.Parameters.AddWithValue("@Y", textBoxYear.Text);
                var dialogResult = MessageBox.Show("Are you sure to update selected group", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Information, MessageBoxDefaultButton.Button2);
                if (dialogResult == DialogResult.Yes)
                {
                    try
                    {
                        command.ExecuteNonQuery();
                        command2.ExecuteNonQuery();
                        command3.ExecuteNonQuery();
                        transaction.Commit();
                        GetAllGroups();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }

                }
            }
        }

        private void dataGridViewGroups_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow selectedrow = dataGridViewGroups.Rows[e.RowIndex];
                foreach (Control control in panelModifyGroups.Controls)
                {
                    if (control is TextBox || control is ComboBox)
                    {
                        control.Text = selectedrow.Cells[$"{(control.Name).Split("Box")[1]}"].Value.ToString();
                    }
                }
                GetGroupStudents();
            }


        }


    }
    public class Group
    {
        public string Name { get; set; }
        public string Major { get; set; }
        public string Department { get; set; }
        public int MaxCount { get; set; }
        public int StudentNumber { get; set; }
        public int Year { get; set; }
    }
}
