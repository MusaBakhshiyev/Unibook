using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Unibook.UnibookAdmin
{
    public partial class AdminPageFirst : UserControl
    {

        public AdminPageFirst()
        {
            InitializeComponent();
        }
        private void PanelSelectedLocation(Button button)
        {
            panelSelected.Visible = true;
            panelSelected.Location = new Point(button.Location.X, button.Location.Y);
            panelSelected.BringToFront();
        }
        private void buttonModifyStudents_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModifyStudents);
            PageModifyStudent modifyStudent = new PageModifyStudent();
            modifyStudent.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(modifyStudent);
        }

        private void buttonModifyTeachers_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModifyTeachers);
            PageModifyTeacher modifyTeacher = new PageModifyTeacher();
            modifyTeacher.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(modifyTeacher);
        }

        private void buttonModifyGroups_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModifyGroups);
            PageModifyGroup modifyGroup = new PageModifyGroup();
            modifyGroup.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(modifyGroup);
        }

        private void buttonModfiyLessons_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModfiyLessons);
            PageModifyLessons pageModifyLessons = new PageModifyLessons();
            pageModifyLessons.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(pageModifyLessons);
        }

        private void buttonModifyParticipates_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModifyParticipates);
            PageModifyParticipates pageModifyParticipates = new PageModifyParticipates();
            pageModifyParticipates.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(pageModifyParticipates);
        }

        private void buttonModifyGrades_Click(object sender, EventArgs e)
        {
            PanelSelectedLocation(buttonModifyGrades);
            PageModifyGrades pageModifyGrades = new PageModifyGrades();
            pageModifyGrades.Dock = DockStyle.Fill;
            panelAdminMain.Controls.Clear();
            panelAdminMain.Controls.Add(pageModifyGrades);
        }

        private void buttonLogOut_Click(object sender, EventArgs e)
        {
            this.ParentForm.Hide();
            Form1 form = new Form1();
            form.Show();
        }
    }
}
