namespace Unibook.UnibookStudent
{
    partial class PageGPA
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
            dataGridViewGrades = new System.Windows.Forms.DataGridView();
            Subjects = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FirstGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            SecondGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ThirdGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FourthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FifthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            TotalGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            comboBoxCourse = new System.Windows.Forms.ComboBox();
            labelCourse = new System.Windows.Forms.Label();
            labelSemester = new System.Windows.Forms.Label();
            comboBoxSemester = new System.Windows.Forms.ComboBox();
            labelGPA = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).BeginInit();
            SuspendLayout();
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
            dataGridViewGrades.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] { Subjects, FirstGrade, SecondGrade, ThirdGrade, FourthGrade, FifthGrade, TotalGrade });
            dataGridViewGrades.Location = new System.Drawing.Point(15, 90);
            dataGridViewGrades.Name = "dataGridViewGrades";
            dataGridViewGrades.ReadOnly = true;
            dataGridViewGrades.RowHeadersVisible = false;
            dataGridViewGrades.RowTemplate.Height = 40;
            dataGridViewGrades.RowTemplate.ReadOnly = true;
            dataGridViewGrades.Size = new System.Drawing.Size(855, 385);
            dataGridViewGrades.TabIndex = 48;
            // 
            // Subjects
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            Subjects.DefaultCellStyle = dataGridViewCellStyle2;
            Subjects.HeaderText = "Subjects";
            Subjects.Name = "Subjects";
            Subjects.ReadOnly = true;
            Subjects.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            Subjects.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            Subjects.Width = 250;
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
            // comboBoxCourse
            // 
            comboBoxCourse.FormattingEnabled = true;
            comboBoxCourse.Items.AddRange(new object[] { "1", "2", "3", "4" });
            comboBoxCourse.Location = new System.Drawing.Point(15, 37);
            comboBoxCourse.Name = "comboBoxCourse";
            comboBoxCourse.Size = new System.Drawing.Size(157, 23);
            comboBoxCourse.TabIndex = 49;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            // 
            // labelCourse
            // 
            labelCourse.AutoSize = true;
            labelCourse.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelCourse.Location = new System.Drawing.Point(15, 14);
            labelCourse.Name = "labelCourse";
            labelCourse.Size = new System.Drawing.Size(57, 20);
            labelCourse.TabIndex = 51;
            labelCourse.Text = "Course";
            // 
            // labelSemester
            // 
            labelSemester.AutoSize = true;
            labelSemester.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSemester.Location = new System.Drawing.Point(207, 14);
            labelSemester.Name = "labelSemester";
            labelSemester.Size = new System.Drawing.Size(74, 20);
            labelSemester.TabIndex = 52;
            labelSemester.Text = "Semester";
            // 
            // comboBoxSemester
            // 
            comboBoxSemester.FormattingEnabled = true;
            comboBoxSemester.Items.AddRange(new object[] { "Autumn", "Spring" });
            comboBoxSemester.Location = new System.Drawing.Point(207, 37);
            comboBoxSemester.Name = "comboBoxSemester";
            comboBoxSemester.Size = new System.Drawing.Size(157, 23);
            comboBoxSemester.TabIndex = 50;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            // 
            // labelGPA
            // 
            labelGPA.BackColor = System.Drawing.SystemColors.Control;
            labelGPA.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            labelGPA.Font = new System.Drawing.Font("Segoe UI", 72F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGPA.Location = new System.Drawing.Point(16, 204);
            labelGPA.Name = "labelGPA";
            labelGPA.Size = new System.Drawing.Size(853, 270);
            labelGPA.TabIndex = 53;
            labelGPA.Text = "GPA: 100";
            labelGPA.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // PageGPA
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoScroll = true;
            Controls.Add(labelGPA);
            Controls.Add(comboBoxCourse);
            Controls.Add(labelCourse);
            Controls.Add(labelSemester);
            Controls.Add(comboBoxSemester);
            Controls.Add(dataGridViewGrades);
            Name = "PageGPA";
            Size = new System.Drawing.Size(1366, 588);
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewGrades;
        private System.Windows.Forms.ComboBox comboBoxCourse;
        private System.Windows.Forms.Label labelCourse;
        private System.Windows.Forms.Label labelSemester;
        private System.Windows.Forms.ComboBox comboBoxSemester;
        private System.Windows.Forms.Label labelGPA;
        private System.Windows.Forms.DataGridViewTextBoxColumn Subjects;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn SecondGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn ThirdGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FourthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FifthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalGrade;
    }
}
