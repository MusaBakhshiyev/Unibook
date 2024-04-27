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
    public partial class PageGroup : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageGroup()
        {
            InitializeComponent();
            GetGroup();
        }
        private void GetGroup()
        {
            dataGridViewStudents.Rows.Clear();
            labelGroupName.Text = "Group Name: " + StudentLogin.GroupName;
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Department,Major from Groups where Name='{StudentLogin.GroupName}'";
                var data = command.ExecuteReader();
                if (data.Read())
                {
                    labelDepartment.Text = "Department: " + data.GetString(0);
                    labelMajor.Text = "Major: " + data.GetString(1);
                }
            }
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select Name,Surname,FatherName,EMail,PhoneNumber from Student where GroupName='{StudentLogin.GroupName}'";
                var data = command.ExecuteReader();
                int i = 0;
                while (data.Read())
                {
                    dataGridViewStudents.Rows.Add(data.GetString(0) + " " + data.GetString(1) + " " + data.GetString(2));
                    dataGridViewStudents[1, i].Value = data.GetString(3);
                    dataGridViewStudents[2, i].Value = data.GetString(4);
                    i++;
                }
            }
        }

        private void PageGroup_ClientSizeChanged(object sender, EventArgs e)
        {
            if (this.Width < 1200)
            {
                pictureBox1.Size = new Size(dataGridViewStudents.Location.X - 20, ClientSize.Height - 200);
                pictureBox1.Location = new Point(pictureBox1.Location.X, ClientRectangle.Bottom - pictureBox1.Height - 10);
            }
            else
            {
                pictureBox1.Size = new Size(dataGridViewStudents.Location.X - 100, ClientSize.Height - 225);
                pictureBox1.Location = new Point(pictureBox1.Location.X, ClientRectangle.Bottom - pictureBox1.Height - 40);

            }
        }
    }

}
