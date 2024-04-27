namespace Unibook.UnibookStudent
{
    partial class PageGroup
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PageGroup));
            dataGridViewStudents = new System.Windows.Forms.DataGridView();
            Students = new System.Windows.Forms.DataGridViewTextBoxColumn();
            EMail = new System.Windows.Forms.DataGridViewTextBoxColumn();
            PhoneNumber = new System.Windows.Forms.DataGridViewTextBoxColumn();
            labelGroupName = new System.Windows.Forms.Label();
            labelMajor = new System.Windows.Forms.Label();
            labelDepartment = new System.Windows.Forms.Label();
            pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewStudents
            // 
            dataGridViewStudents.AllowUserToAddRows = false;
            dataGridViewStudents.AllowUserToDeleteRows = false;
            dataGridViewStudents.AllowUserToResizeColumns = false;
            dataGridViewStudents.AllowUserToResizeRows = false;
            dataGridViewStudents.BackgroundColor = System.Drawing.Color.Lavender;
            dataGridViewStudents.BorderStyle = System.Windows.Forms.BorderStyle.None;
            dataGridViewStudents.ColumnHeadersHeight = 40;
            dataGridViewStudents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridViewStudents.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] { Students, EMail, PhoneNumber });
            dataGridViewStudents.Dock = System.Windows.Forms.DockStyle.Right;
            dataGridViewStudents.Location = new System.Drawing.Point(863, 0);
            dataGridViewStudents.Name = "dataGridViewStudents";
            dataGridViewStudents.RowHeadersVisible = false;
            dataGridViewStudents.RowTemplate.Height = 40;
            dataGridViewStudents.Size = new System.Drawing.Size(503, 706);
            dataGridViewStudents.TabIndex = 0;
            // 
            // Students
            // 
            Students.HeaderText = "Students";
            Students.Name = "Students";
            Students.ReadOnly = true;
            Students.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            Students.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            Students.Width = 200;
            // 
            // EMail
            // 
            EMail.HeaderText = "E-Mail";
            EMail.Name = "EMail";
            EMail.ReadOnly = true;
            EMail.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            EMail.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            EMail.Width = 200;
            // 
            // PhoneNumber
            // 
            PhoneNumber.HeaderText = "Phone Number";
            PhoneNumber.Name = "PhoneNumber";
            PhoneNumber.ReadOnly = true;
            PhoneNumber.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            PhoneNumber.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // labelGroupName
            // 
            labelGroupName.BackColor = System.Drawing.Color.Salmon;
            labelGroupName.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGroupName.ForeColor = System.Drawing.Color.White;
            labelGroupName.Location = new System.Drawing.Point(0, 44);
            labelGroupName.Name = "labelGroupName";
            labelGroupName.Size = new System.Drawing.Size(180, 40);
            labelGroupName.TabIndex = 1;
            labelGroupName.Text = "Group Name: CE.23E-1";
            labelGroupName.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // labelMajor
            // 
            labelMajor.BackColor = System.Drawing.Color.Salmon;
            labelMajor.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelMajor.ForeColor = System.Drawing.Color.White;
            labelMajor.Location = new System.Drawing.Point(0, 84);
            labelMajor.Name = "labelMajor";
            labelMajor.Size = new System.Drawing.Size(237, 40);
            labelMajor.TabIndex = 1;
            labelMajor.Text = "Major: Computer Engineering";
            labelMajor.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // labelDepartment
            // 
            labelDepartment.BackColor = System.Drawing.Color.Salmon;
            labelDepartment.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelDepartment.ForeColor = System.Drawing.Color.White;
            labelDepartment.Location = new System.Drawing.Point(0, 124);
            labelDepartment.Name = "labelDepartment";
            labelDepartment.Size = new System.Drawing.Size(166, 40);
            labelDepartment.TabIndex = 1;
            labelDepartment.Text = "Department: English";
            labelDepartment.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (System.Drawing.Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new System.Drawing.Point(0, 166);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new System.Drawing.Size(637, 425);
            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 2;
            pictureBox1.TabStop = false;
            // 
            // PageGroup
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            BackColor = System.Drawing.Color.Lavender;
            Controls.Add(labelMajor);
            Controls.Add(labelGroupName);
            Controls.Add(labelDepartment);
            Controls.Add(pictureBox1);
            Controls.Add(dataGridViewStudents);
            Name = "PageGroup";
            Size = new System.Drawing.Size(1366, 706);
            ClientSizeChanged += PageGroup_ClientSizeChanged;
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewStudents;
        private System.Windows.Forms.Label labelGroupName;
        private System.Windows.Forms.Label labelMajor;
        private System.Windows.Forms.Label labelDepartment;
        private System.Windows.Forms.DataGridViewTextBoxColumn Students;
        private System.Windows.Forms.DataGridViewTextBoxColumn EMail;
        private System.Windows.Forms.DataGridViewTextBoxColumn PhoneNumber;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}
