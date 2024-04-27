namespace Unibook.UnibookTeacher
{
    partial class PageModifyGrades
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
            Students = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FirstGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            SecondGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ThirdGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FourthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FifthGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            TotalGrade = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewGrades
            // 
            dataGridViewGrades.AllowUserToAddRows = false;
            dataGridViewGrades.AllowUserToDeleteRows = false;
            dataGridViewGrades.AllowUserToResizeColumns = false;
            dataGridViewGrades.AllowUserToResizeRows = false;
            dataGridViewGrades.BackgroundColor = System.Drawing.Color.WhiteSmoke;
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
            dataGridViewGrades.Location = new System.Drawing.Point(286, 12);
            dataGridViewGrades.Name = "dataGridViewGrades";
            dataGridViewGrades.ReadOnly = true;
            dataGridViewGrades.RowHeadersVisible = false;
            dataGridViewGrades.RowTemplate.Height = 30;
            dataGridViewGrades.RowTemplate.ReadOnly = true;
            dataGridViewGrades.Size = new System.Drawing.Size(795, 408);
            dataGridViewGrades.TabIndex = 42;
            dataGridViewGrades.CellClick += dataGridViewGrades_CellClick;
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
            // PageModifyGrades
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(dataGridViewGrades);
            Name = "PageModifyGrades";
            Size = new System.Drawing.Size(1366, 432);
            ((System.ComponentModel.ISupportInitialize)dataGridViewGrades).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewGrades;
        private System.Windows.Forms.DataGridViewTextBoxColumn Students;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn SecondGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn ThirdGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FourthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn FifthGrade;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalGrade;
    }
}
