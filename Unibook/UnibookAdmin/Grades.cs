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
    public partial class Grades : Form
    {
        int grade;
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";
        string GN;
        string SN;
        string StN;
        string GO;
        public Grades(string GN,string SN,string StN,string GO)
        {
            InitializeComponent();
            this.GN = GN;
            this.SN = SN;
            this.StN = StN;
            this.GO = GO;
            ButtonEventHandler();
        }

        private void ButtonEventHandler()
        {
            foreach(Control control in Controls)
            {
                if(control is Button)
                {
                    control.Click += Button_Click;
                }
            }
        }
        private void Button_Click(object sender, EventArgs e)
        {
            bool HasRows = false;
            Button button = sender as Button;
            grade = int.Parse(button.Text);
            using (var connection = new SqlConnection(constr))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = $"select StudentName from StudentGrades where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder = @GO";
                command.Parameters.AddWithValue("@GN", GN);
                command.Parameters.AddWithValue("@SN", SN);
                command.Parameters.AddWithValue("@StN", StN);
                command.Parameters.AddWithValue("@GO", GO);
                var data = command.ExecuteReader();
                if (data.HasRows)
                {
                    HasRows = true;

                }
            }
            if (HasRows)
            {
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"update StudentGrades set Grade=@G where GroupName=@GN and SubjectName=@SN and StudentName=@StN and GradeOrder = @GO";
                    command.Parameters.AddWithValue("@GN", GN);
                    command.Parameters.AddWithValue("@SN", SN);
                    command.Parameters.AddWithValue("@StN", StN);
                    command.Parameters.AddWithValue("@GO", GO);
                    command.Parameters.AddWithValue("@G", grade);
                    command.ExecuteNonQuery();
                }
            }
            else
            {
                using (var connection = new SqlConnection(constr))
                {
                    connection.Open();
                    var command = connection.CreateCommand();
                    command.CommandText = $"insert into StudentGrades values(@GN,@SN,@StN,@GO,@G)";
                    command.Parameters.AddWithValue("@GN", GN);
                    command.Parameters.AddWithValue("@SN", SN);
                    command.Parameters.AddWithValue("@StN", StN);
                    command.Parameters.AddWithValue("@GO", GO);
                    command.Parameters.AddWithValue("@G", grade);
                    command.ExecuteNonQuery();
                }
            }
           
            Close();
        }
    }
}
