namespace Unibook.UnibookAdmin
{
    partial class PageModifyLessons
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            comboBoxSubject = new System.Windows.Forms.ComboBox();
            labelSubject = new System.Windows.Forms.Label();
            comboBoxGroupName = new System.Windows.Forms.ComboBox();
            labelGroup = new System.Windows.Forms.Label();
            comboBoxCourse = new System.Windows.Forms.ComboBox();
            labelCourse = new System.Windows.Forms.Label();
            comboBoxSemester = new System.Windows.Forms.ComboBox();
            labelSemester = new System.Windows.Forms.Label();
            comboBoxTeacher = new System.Windows.Forms.ComboBox();
            labelTeacher = new System.Windows.Forms.Label();
            comboBoxDayOfWeek = new System.Windows.Forms.ComboBox();
            labelDayOfWeek = new System.Windows.Forms.Label();
            dataGridViewLessons = new System.Windows.Forms.DataGridView();
            Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FirstHour = new System.Windows.Forms.DataGridViewTextBoxColumn();
            SecondHour = new System.Windows.Forms.DataGridViewTextBoxColumn();
            buttonDelete = new System.Windows.Forms.Button();
            buttonUpdate = new System.Windows.Forms.Button();
            buttonAdd = new System.Windows.Forms.Button();
            labelTime = new System.Windows.Forms.Label();
            comboBoxTime = new System.Windows.Forms.ComboBox();
            panelModifyLessons = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)dataGridViewLessons).BeginInit();
            panelModifyLessons.SuspendLayout();
            SuspendLayout();
            // 
            // comboBoxSubject
            // 
            comboBoxSubject.FormattingEnabled = true;
            comboBoxSubject.Location = new System.Drawing.Point(601, 34);
            comboBoxSubject.Name = "comboBoxSubject";
            comboBoxSubject.Size = new System.Drawing.Size(196, 23);
            comboBoxSubject.TabIndex = 4;
            comboBoxSubject.SelectedIndexChanged += comboBoxSubject_SelectedIndexChanged;
            // 
            // labelSubject
            // 
            labelSubject.AutoSize = true;
            labelSubject.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSubject.Location = new System.Drawing.Point(601, 11);
            labelSubject.Name = "labelSubject";
            labelSubject.Size = new System.Drawing.Size(60, 20);
            labelSubject.TabIndex = 26;
            labelSubject.Text = "Subject";
            // 
            // comboBoxGroupName
            // 
            comboBoxGroupName.FormattingEnabled = true;
            comboBoxGroupName.Location = new System.Drawing.Point(25, 34);
            comboBoxGroupName.Name = "comboBoxGroupName";
            comboBoxGroupName.Size = new System.Drawing.Size(157, 23);
            comboBoxGroupName.TabIndex = 1;
            comboBoxGroupName.SelectedIndexChanged += comboBoxGroupName_SelectedIndexChanged;
            // 
            // labelGroup
            // 
            labelGroup.AutoSize = true;
            labelGroup.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGroup.Location = new System.Drawing.Point(25, 11);
            labelGroup.Name = "labelGroup";
            labelGroup.Size = new System.Drawing.Size(53, 20);
            labelGroup.TabIndex = 28;
            labelGroup.Text = "Group";
            // 
            // comboBoxCourse
            // 
            comboBoxCourse.FormattingEnabled = true;
            comboBoxCourse.Items.AddRange(new object[] { "1", "2", "3", "4" });
            comboBoxCourse.Location = new System.Drawing.Point(217, 34);
            comboBoxCourse.Name = "comboBoxCourse";
            comboBoxCourse.Size = new System.Drawing.Size(157, 23);
            comboBoxCourse.TabIndex = 2;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            // 
            // labelCourse
            // 
            labelCourse.AutoSize = true;
            labelCourse.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelCourse.Location = new System.Drawing.Point(217, 11);
            labelCourse.Name = "labelCourse";
            labelCourse.Size = new System.Drawing.Size(57, 20);
            labelCourse.TabIndex = 30;
            labelCourse.Text = "Course";
            // 
            // comboBoxSemester
            // 
            comboBoxSemester.FormattingEnabled = true;
            comboBoxSemester.Items.AddRange(new object[] { "Autumn", "Spring" });
            comboBoxSemester.Location = new System.Drawing.Point(409, 34);
            comboBoxSemester.Name = "comboBoxSemester";
            comboBoxSemester.Size = new System.Drawing.Size(157, 23);
            comboBoxSemester.TabIndex = 3;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            // 
            // labelSemester
            // 
            labelSemester.AutoSize = true;
            labelSemester.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSemester.Location = new System.Drawing.Point(409, 11);
            labelSemester.Name = "labelSemester";
            labelSemester.Size = new System.Drawing.Size(74, 20);
            labelSemester.TabIndex = 32;
            labelSemester.Text = "Semester";
            // 
            // comboBoxTeacher
            // 
            comboBoxTeacher.FormattingEnabled = true;
            comboBoxTeacher.Location = new System.Drawing.Point(409, 98);
            comboBoxTeacher.Name = "comboBoxTeacher";
            comboBoxTeacher.Size = new System.Drawing.Size(157, 23);
            comboBoxTeacher.TabIndex = 7;
            // 
            // labelTeacher
            // 
            labelTeacher.AutoSize = true;
            labelTeacher.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelTeacher.Location = new System.Drawing.Point(409, 75);
            labelTeacher.Name = "labelTeacher";
            labelTeacher.Size = new System.Drawing.Size(63, 20);
            labelTeacher.TabIndex = 34;
            labelTeacher.Text = "Teacher";
            // 
            // comboBoxDayOfWeek
            // 
            comboBoxDayOfWeek.FormattingEnabled = true;
            comboBoxDayOfWeek.Items.AddRange(new object[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" });
            comboBoxDayOfWeek.Location = new System.Drawing.Point(25, 98);
            comboBoxDayOfWeek.Name = "comboBoxDayOfWeek";
            comboBoxDayOfWeek.Size = new System.Drawing.Size(157, 23);
            comboBoxDayOfWeek.TabIndex = 5;
            // 
            // labelDayOfWeek
            // 
            labelDayOfWeek.AutoSize = true;
            labelDayOfWeek.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelDayOfWeek.Location = new System.Drawing.Point(25, 75);
            labelDayOfWeek.Name = "labelDayOfWeek";
            labelDayOfWeek.Size = new System.Drawing.Size(100, 20);
            labelDayOfWeek.TabIndex = 36;
            labelDayOfWeek.Text = "Day Of Week";
            // 
            // dataGridViewLessons
            // 
            dataGridViewLessons.AllowUserToAddRows = false;
            dataGridViewLessons.AllowUserToDeleteRows = false;
            dataGridViewLessons.AllowUserToResizeColumns = false;
            dataGridViewLessons.AllowUserToResizeRows = false;
            dataGridViewLessons.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            dataGridViewLessons.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewLessons.ColumnHeadersHeight = 80;
            dataGridViewLessons.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridViewLessons.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] { Column1, FirstHour, SecondHour });
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            dataGridViewLessons.DefaultCellStyle = dataGridViewCellStyle2;
            dataGridViewLessons.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            dataGridViewLessons.Location = new System.Drawing.Point(25, 231);
            dataGridViewLessons.Name = "dataGridViewLessons";
            dataGridViewLessons.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Light", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            dataGridViewLessons.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            dataGridViewLessons.RowHeadersVisible = false;
            dataGridViewLessons.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            dataGridViewLessons.RowTemplate.Height = 70;
            dataGridViewLessons.ScrollBars = System.Windows.Forms.ScrollBars.None;
            dataGridViewLessons.Size = new System.Drawing.Size(917, 432);
            dataGridViewLessons.TabIndex = 37;
            dataGridViewLessons.CellClick += dataGridViewLessons_CellClick;
            // 
            // Column1
            // 
            Column1.HeaderText = "";
            Column1.Name = "Column1";
            Column1.ReadOnly = true;
            Column1.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            Column1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            Column1.Width = 200;
            // 
            // FirstHour
            // 
            FirstHour.HeaderText = "09:00-10:00";
            FirstHour.Name = "FirstHour";
            FirstHour.ReadOnly = true;
            FirstHour.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            FirstHour.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            FirstHour.Width = 357;
            // 
            // SecondHour
            // 
            SecondHour.HeaderText = "10:10-11:10";
            SecondHour.Name = "SecondHour";
            SecondHour.ReadOnly = true;
            SecondHour.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            SecondHour.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            SecondHour.Width = 357;
            // 
            // buttonDelete
            // 
            buttonDelete.BackColor = System.Drawing.Color.Red;
            buttonDelete.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonDelete.ForeColor = System.Drawing.Color.White;
            buttonDelete.Location = new System.Drawing.Point(145, 152);
            buttonDelete.Name = "buttonDelete";
            buttonDelete.Size = new System.Drawing.Size(100, 37);
            buttonDelete.TabIndex = 9;
            buttonDelete.Text = "Delete";
            buttonDelete.UseVisualStyleBackColor = false;
            buttonDelete.Click += buttonDelete_Click;
            // 
            // buttonUpdate
            // 
            buttonUpdate.BackColor = System.Drawing.Color.FromArgb(0, 192, 0);
            buttonUpdate.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonUpdate.ForeColor = System.Drawing.Color.White;
            buttonUpdate.Location = new System.Drawing.Point(265, 152);
            buttonUpdate.Name = "buttonUpdate";
            buttonUpdate.Size = new System.Drawing.Size(100, 37);
            buttonUpdate.TabIndex = 10;
            buttonUpdate.Text = "Update";
            buttonUpdate.UseVisualStyleBackColor = false;
            buttonUpdate.Click += buttonUpdate_Click;
            // 
            // buttonAdd
            // 
            buttonAdd.BackColor = System.Drawing.Color.Blue;
            buttonAdd.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonAdd.ForeColor = System.Drawing.Color.White;
            buttonAdd.Location = new System.Drawing.Point(25, 152);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new System.Drawing.Size(100, 37);
            buttonAdd.TabIndex = 8;
            buttonAdd.Text = "Add";
            buttonAdd.UseVisualStyleBackColor = false;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // labelTime
            // 
            labelTime.AutoSize = true;
            labelTime.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelTime.Location = new System.Drawing.Point(217, 75);
            labelTime.Name = "labelTime";
            labelTime.Size = new System.Drawing.Size(44, 20);
            labelTime.TabIndex = 36;
            labelTime.Text = "Time";
            // 
            // comboBoxTime
            // 
            comboBoxTime.FormattingEnabled = true;
            comboBoxTime.Items.AddRange(new object[] { "09:00-10:00", "10:10-11:10" });
            comboBoxTime.Location = new System.Drawing.Point(217, 98);
            comboBoxTime.Name = "comboBoxTime";
            comboBoxTime.Size = new System.Drawing.Size(157, 23);
            comboBoxTime.TabIndex = 6;
            // 
            // panelModifyLessons
            // 
            panelModifyLessons.AutoScroll = true;
            panelModifyLessons.Controls.Add(labelTeacher);
            panelModifyLessons.Controls.Add(labelDayOfWeek);
            panelModifyLessons.Controls.Add(labelGroup);
            panelModifyLessons.Controls.Add(buttonAdd);
            panelModifyLessons.Controls.Add(buttonDelete);
            panelModifyLessons.Controls.Add(dataGridViewLessons);
            panelModifyLessons.Controls.Add(buttonUpdate);
            panelModifyLessons.Controls.Add(comboBoxTime);
            panelModifyLessons.Controls.Add(comboBoxGroupName);
            panelModifyLessons.Controls.Add(labelTime);
            panelModifyLessons.Controls.Add(comboBoxDayOfWeek);
            panelModifyLessons.Controls.Add(comboBoxCourse);
            panelModifyLessons.Controls.Add(comboBoxTeacher);
            panelModifyLessons.Controls.Add(labelCourse);
            panelModifyLessons.Controls.Add(labelSemester);
            panelModifyLessons.Controls.Add(comboBoxSemester);
            panelModifyLessons.Controls.Add(labelSubject);
            panelModifyLessons.Controls.Add(comboBoxSubject);
            panelModifyLessons.Dock = System.Windows.Forms.DockStyle.Fill;
            panelModifyLessons.Location = new System.Drawing.Point(0, 0);
            panelModifyLessons.Name = "panelModifyLessons";
            panelModifyLessons.Size = new System.Drawing.Size(1168, 650);
            panelModifyLessons.TabIndex = 41;
            // 
            // PageModifyLessons
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            Controls.Add(panelModifyLessons);
            Name = "PageModifyLessons";
            Size = new System.Drawing.Size(1168, 650);
            Load += PageModifyLessons_Load;
            ((System.ComponentModel.ISupportInitialize)dataGridViewLessons).EndInit();
            panelModifyLessons.ResumeLayout(false);
            panelModifyLessons.PerformLayout();
            ResumeLayout(false);
        }

        #endregion
        private System.Windows.Forms.ComboBox comboBoxSubject;
        private System.Windows.Forms.Label labelSubject;
        private System.Windows.Forms.ComboBox comboBoxGroupName;
        private System.Windows.Forms.Label labelGroup;
        private System.Windows.Forms.ComboBox comboBoxCourse;
        private System.Windows.Forms.Label labelCourse;
        private System.Windows.Forms.ComboBox comboBoxSemester;
        private System.Windows.Forms.Label labelSemester;
        private System.Windows.Forms.ComboBox comboBoxTeacher;
        private System.Windows.Forms.Label labelTeacher;
        private System.Windows.Forms.ComboBox comboBoxDayOfWeek;
        private System.Windows.Forms.Label labelDayOfWeek;
        private System.Windows.Forms.DataGridView dataGridViewLessons;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Label labelTime;
        private System.Windows.Forms.ComboBox comboBoxTime;
        private System.Windows.Forms.Panel panelModifyLessons;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstHour;
        private System.Windows.Forms.DataGridViewTextBoxColumn SecondHour;
    }
}
