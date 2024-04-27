using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Unibook.UnibookAdmin;

namespace Unibook.UnibookStudent
{
    public partial class StudentMainPage : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public StudentMainPage()
        {
            InitializeComponent();
            labelUserName.Text = StudentLogin.Name + " " + StudentLogin.Surname;
            buttonLogOut.Location = new Point(labelUserName.Location.X + labelUserName.Width + 20, buttonLogOut.Location.Y);
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (panelOptions.Size == new Size(120, 61))
            {
                panelOptions.Size = new Size(120, 370);
            }
            else
            {
                panelOptions.Size = new Size(120, 61);
            }
        }

        private void buttonLogOut_Click(object sender, EventArgs e)
        {
            this.ParentForm.Hide();
            Form1 form = new Form1();
            form.Show();
        }

        private void buttonGroup_Click(object sender, EventArgs e)
        {
            buttonGroup.BackColor = Color.LightSteelBlue;
            buttonSubjects.BackColor = Color.SteelBlue;
            buttonInformation.BackColor = Color.SteelBlue;
            buttonLessonTime.BackColor = Color.SteelBlue;
            buttonGPA.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageGroup pageGroup = new PageGroup();
            pageGroup.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageGroup);
        }

        private void buttonSubjects_Click(object sender, EventArgs e)
        {
            buttonSubjects.BackColor = Color.LightSteelBlue;
            buttonInformation.BackColor = Color.SteelBlue;
            buttonGroup.BackColor = Color.SteelBlue;
            buttonLessonTime.BackColor = Color.SteelBlue;
            buttonGPA.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageSubjects pageSubjects = new PageSubjects();
            pageSubjects.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageSubjects);
        }

        private void buttonInformation_Click(object sender, EventArgs e)
        {
            buttonInformation.BackColor = Color.LightSteelBlue;
            buttonGroup.BackColor = Color.SteelBlue;
            buttonSubjects.BackColor = Color.SteelBlue;
            buttonLessonTime.BackColor = Color.SteelBlue;
            buttonGPA.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageInformation pageInformation = new PageInformation();
            pageInformation.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageInformation);
        }

        private void pictureBox1_MouseEnter(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Gainsboro;
        }

        private void pictureBox1_MouseLeave(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Lavender;
        }

        private void buttonLessonTime_Click(object sender, EventArgs e)
        {
            buttonLessonTime.BackColor = Color.LightSteelBlue;
            buttonGroup.BackColor = Color.SteelBlue;
            buttonSubjects.BackColor = Color.SteelBlue;
            buttonInformation.BackColor = Color.SteelBlue;
            buttonGPA.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageLessonTime pageLessonTime = new PageLessonTime();
            pageLessonTime.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageLessonTime);
        }

        private void buttonGPA_Click(object sender, EventArgs e)
        {
            buttonGPA.BackColor = Color.LightSteelBlue;
            buttonGroup.BackColor = Color.SteelBlue;
            buttonSubjects.BackColor = Color.SteelBlue;
            buttonInformation.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageGPA pageGPA = new PageGPA();
            pageGPA.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageGPA);
        }
    }
}
