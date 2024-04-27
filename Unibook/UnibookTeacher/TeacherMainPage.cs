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
    public partial class TeacherMainPage : UserControl
    {
        public TeacherMainPage()
        {
            InitializeComponent();
            labelUserName.Text = TeacherLogin.Name + " " + TeacherLogin.Surname;
            buttonLogOut.Location = new Point(labelUserName.Location.X + labelUserName.Width + 20, buttonLogOut.Location.Y);
        }
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (panelOptions.Size == new Size(120, 61))
            {
                panelOptions.Size = new Size(120, 200);
            }
            else
            {
                panelOptions.Size = new Size(120, 61);
            }
        }
        private void pictureBox1_MouseEnter(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Gainsboro;
        }

        private void pictureBox1_MouseLeave(object sender, EventArgs e)
        {
            pictureBox1.BackColor = Color.Lavender;
        }

        private void buttonLogOut_Click(object sender, EventArgs e)
        {
            this.ParentForm.Hide();
            Form1 form = new Form1();
            form.Show();
        }
        private void buttonInformation_Click(object sender, EventArgs e)
        {
            buttonInformation.BackColor = Color.LightSteelBlue;
            buttonGroup.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageInformation pageInformation = new PageInformation();
            pageInformation.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageInformation);
        }

        private void buttonGroup_Click(object sender, EventArgs e)
        {
            buttonGroup.BackColor = Color.LightSteelBlue;
            buttonInformation.BackColor = Color.SteelBlue;
            panelOptions.Size = new Size(120, 61);
            PageGroups pageGroup = new PageGroups();
            pageGroup.Dock = DockStyle.Fill;
            panelMain.Controls.Clear();
            panelMain.Controls.Add(pageGroup);
        }

    }
}
