using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Unibook.UnibookStudent
{
    public partial class PageSubjects : UserControl
    {
        private string constr = @"Server=.\SQLEXPRESS;Database=Unibook;User Id=sa;Password=BaMu2005.;TrustServerCertificate=True;";

        public PageSubjects()
        {
            InitializeComponent();
        }

        private void buttonParticipation_Click(object sender, EventArgs e)
        {
            PageParticipation pageParticipation = new PageParticipation();
            pageParticipation.Dock = DockStyle.Fill;
            panelMainSubject.Controls.Clear();
            panelMainSubject.Controls.Add(pageParticipation);
        }

        private void PageSubjects_ClientSizeChanged(object sender, EventArgs e)
        {
            panelMainSubject.Height = panelMainSubject.Location.Y + panelMainSubject.Height - (buttonParticipation.Location.Y + buttonParticipation.Height + 50);
        }

        private void buttonGrades_Click(object sender, EventArgs e)
        {
            PageGrades pageGrades = new PageGrades();
            pageGrades.Dock = DockStyle.Fill;
            panelMainSubject.Controls.Clear();
            panelMainSubject.Controls.Add(pageGrades);
        }
    }
}
