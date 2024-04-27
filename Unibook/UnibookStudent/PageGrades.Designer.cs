namespace Unibook.UnibookStudent
{
    partial class PageGrades
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PageGrades));
            comboBoxCourse = new System.Windows.Forms.ComboBox();
            labelCourse = new System.Windows.Forms.Label();
            labelSemester = new System.Windows.Forms.Label();
            comboBoxSemester = new System.Windows.Forms.ComboBox();
            labelSubject = new System.Windows.Forms.Label();
            comboBoxSubject = new System.Windows.Forms.ComboBox();
            dataGridViewGrades = new System.Windows.Forms.DataGridView();
            Students = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FirstGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            SecondGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ThirdGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FourthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FifthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            TotalGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            pictureBox1 = new System.Windows.Forms.PictureBox();
            pictureBox2 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).BeginInit();
            SuspendLayout();
            // 
            // comboBoxCourse
            // 
            comboBoxCourse.FormattingEnabled = true;
            comboBoxCourse.Items.AddRange(new object[] { "1", "2", "3", "4" });
            comboBoxCourse.Location = new System.Drawing.Point(12, 32);
            comboBoxCourse.Name = "comboBoxCourse";
            comboBoxCourse.Size = new System.Drawing.Size(157, 23);
            comboBoxCourse.TabIndex = 41;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            // 
            // labelCourse
            // 
            labelCourse.AutoSize = true;
            labelCourse.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelCourse.Location = new System.Drawing.Point(12, 9);
            labelCourse.Name = "labelCourse";
            labelCourse.Size = new System.Drawing.Size(57, 20);
            labelCourse.TabIndex = 45;
            labelCourse.Text = "Course";
            // 
            // labelSemester
            // 
            labelSemester.AutoSize = true;
            labelSemester.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSemester.Location = new System.Drawing.Point(204, 9);
            labelSemester.Name = "labelSemester";
            labelSemester.Size = new System.Drawing.Size(74, 20);
            labelSemester.TabIndex = 46;
            labelSemester.Text = "Semester";
            // 
            // comboBoxSemester
            // 
            comboBoxSemester.FormattingEnabled = true;
            comboBoxSemester.Items.AddRange(new object[] { "Autumn", "Spring" });
            comboBoxSemester.Location = new System.Drawing.Point(204, 32);
            comboBoxSemester.Name = "comboBoxSemester";
            comboBoxSemester.Size = new System.Drawing.Size(157, 23);
            comboBoxSemester.TabIndex = 42;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            // 
            // labelSubject
            // 
            labelSubject.AutoSize = true;
            labelSubject.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSubject.Location = new System.Drawing.Point(396, 9);
            labelSubject.Name = "labelSubject";
            labelSubject.Size = new System.Drawing.Size(60, 20);
            labelSubject.TabIndex = 44;
            labelSubject.Text = "Subject";
            // 
            // comboBoxSubject
            // 
            comboBoxSubject.FormattingEnabled = true;
            comboBoxSubject.Location = new System.Drawing.Point(396, 32);
            comboBoxSubject.Name = "comboBoxSubject";
            comboBoxSubject.Size = new System.Drawing.Size(196, 23);
            comboBoxSubject.TabIndex = 43;
            comboBoxSubject.SelectedIndexChanged += comboBoxSubject_SelectedIndexChanged;
            // 
            // dataGridViewGrades
            // 
            dataGridViewGrades.AllowUserToAddRows = false;
            dataGridViewGrades.AllowUserToDeleteRows = false;
            dataGridViewGrades.AllowUserToResizeColumns = false;
            dataGridViewGrades.AllowUserToResizeRows = false;
            dataGridViewGrades.BackgroundColor = System.Drawing.Color.Lavender;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            dataGridViewGrades.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewGrades.ColumnHeadersHeight = 30;
            dataGridViewGrades.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridViewGrades.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] { Students, FirstGrade, SecondGrade, ThirdGrade, FourthGrade, FifthGrade, TotalGrade });
            dataGridViewGrades.Location = new System.Drawing.Point(12, 102);
            dataGridViewGrades.Name = "dataGridViewGrades";
            dataGridViewGrades.ReadOnly = true;
            dataGridViewGrades.RowHeadersVisible = false;
            dataGridViewGrades.RowTemplate.Height = 40;
            dataGridViewGrades.RowTemplate.ReadOnly = true;
            dataGridViewGrades.Size = new System.Drawing.Size(795, 408);
            dataGridViewGrades.TabIndex = 47;
            // 
            // Students
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            Students.DefaultCellStyle = dataGridViewCellStyle2;
            Students.HeaderText = "Students";
            Students.Name = "Students";
            Students.ReadOnly = true;
            Students.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            Students.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            Students.Width = 190;
            // 
            // FirstGrade
            // 
            FirstGrade.HeaderText = "First Grade";
            FirstGrade.Name = "FirstGrade";
            FirstGrade.ReadOnly = true;
            FirstGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            FirstGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // SecondGrade
            // 
            SecondGrade.HeaderText = "Second Grade";
            SecondGrade.Name = "SecondGrade";
            SecondGrade.ReadOnly = true;
            SecondGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            SecondGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // ThirdGrade
            // 
            ThirdGrade.HeaderText = "Third Grade";
            ThirdGrade.Name = "ThirdGrade";
            ThirdGrade.ReadOnly = true;
            ThirdGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            ThirdGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // FourthGrade
            // 
            FourthGrade.HeaderText = "Fourth Grade";
            FourthGrade.Name = "FourthGrade";
            FourthGrade.ReadOnly = true;
            FourthGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            FourthGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // FifthGrade
            // 
            FifthGrade.HeaderText = "Fifth Grade";
            FifthGrade.Name = "FifthGrade";
            FifthGrade.ReadOnly = true;
            FifthGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            FifthGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic;
            // 
            // TotalGrade
            // 
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            TotalGrade.DefaultCellStyle = dataGridViewCellStyle3;
            TotalGrade.HeaderText = "Total Grade";
            TotalGrade.Name = "TotalGrade";
            TotalGrade.ReadOnly = true;
            TotalGrade.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            TotalGrade.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (System.Drawing.Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new System.Drawing.Point(15, 253);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new System.Drawing.Size(346, 254);
            pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 48;
            pictureBox1.TabStop = false;
            // 
            // pictureBox2
            // 
            pictureBox2.Image = (System.Drawing.Image)resources.GetObject("pictureBox2.Image");
            pictureBox2.Location = new System.Drawing.Point(455, 253);
            pictureBox2.Name = "pictureBox2";
            pictureBox2.Size = new System.Drawing.Size(346, 254);
            pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            pictureBox2.TabIndex = 48;
            pictureBox2.TabStop = false;
            // 
            // PageGrades
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoScroll = true;
            Controls.Add(pictureBox2);
            Controls.Add(pictureBox1);
            Controls.Add(dataGridViewGrades);
            Controls.Add(comboBoxCourse);
            Controls.Add(labelCourse);
            Controls.Add(labelSemester);
            Controls.Add(comboBoxSemester);
            Controls.Add(labelSubject);
            Controls.Add(comboBoxSubject);
            Name = "PageGrades";
            Size = new System.Drawing.Size(1215, 639);
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureBox2).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxCourse;
        private System.Windows.Forms.Label labelCourse;
        private System.Windows.Forms.Label labelSemester;
        private System.Windows.Forms.ComboBox comboBoxSemester;
        private System.Windows.Forms.Label labelSubject;
        private System.Windows.Forms.ComboBox comboBoxSubject;
        private System.Windows.Forms.DataGridView dataGridViewGrades;
        private System.Windows.Forms.DataGridViewTextBoxColumn Students;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn SecondGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn ThirdGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FourthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FifthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalGrade;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}
