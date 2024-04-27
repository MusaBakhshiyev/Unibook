namespace Unibook.UnibookTeacher
{
    partial class PageLessonTime
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
            dataGridViewLessons = new System.Windows.Forms.DataGridView();
            Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            FirstHour = new System.Windows.Forms.DataGridViewTextBoxColumn();
            SecondHour = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)dataGridViewLessons).BeginInit();
            SuspendLayout();
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
            dataGridViewLessons.Location = new System.Drawing.Point(225, 18);
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
            dataGridViewLessons.TabIndex = 50;
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
            // PageLessonTime
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(dataGridViewLessons);
            Name = "PageLessonTime";
            Size = new System.Drawing.Size(1366, 468);
            ((System.ComponentModel.ISupportInitialize)dataGridViewLessons).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewLessons;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn FirstHour;
        private System.Windows.Forms.DataGridViewTextBoxColumn SecondHour;
    }
}
