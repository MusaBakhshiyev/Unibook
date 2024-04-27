namespace Unibook.UnibookStudent
{
    partial class PageParticipation
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
            dataGridViewParticipates = new System.Windows.Forms.DataGridView();
            buttonBack = new System.Windows.Forms.Button();
            buttonNext = new System.Windows.Forms.Button();
            labelAbsentNumber = new System.Windows.Forms.Label();
            comboBoxSemester = new System.Windows.Forms.ComboBox();
            comboBoxSubject = new System.Windows.Forms.ComboBox();
            labelSubject = new System.Windows.Forms.Label();
            comboBoxCourse = new System.Windows.Forms.ComboBox();
            labelSemester = new System.Windows.Forms.Label();
            labelCourse = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewParticipates
            // 
            dataGridViewParticipates.AllowUserToAddRows = false;
            dataGridViewParticipates.AllowUserToDeleteRows = false;
            dataGridViewParticipates.AllowUserToResizeColumns = false;
            dataGridViewParticipates.AllowUserToResizeRows = false;
            dataGridViewParticipates.BackgroundColor = System.Drawing.Color.White;
            dataGridViewParticipates.ColumnHeadersHeight = 50;
            dataGridViewParticipates.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            dataGridViewParticipates.Location = new System.Drawing.Point(7, 139);
            dataGridViewParticipates.Name = "dataGridViewParticipates";
            dataGridViewParticipates.ReadOnly = true;
            dataGridViewParticipates.RowHeadersVisible = false;
            dataGridViewParticipates.RowTemplate.Height = 40;
            dataGridViewParticipates.Size = new System.Drawing.Size(895, 250);
            dataGridViewParticipates.TabIndex = 0;
            // 
            // buttonBack
            // 
            buttonBack.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonBack.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonBack.Location = new System.Drawing.Point(7, 102);
            buttonBack.Name = "buttonBack";
            buttonBack.Size = new System.Drawing.Size(76, 31);
            buttonBack.TabIndex = 42;
            buttonBack.Text = "Back";
            buttonBack.UseVisualStyleBackColor = false;
            buttonBack.Click += buttonBack_Click;
            // 
            // buttonNext
            // 
            buttonNext.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonNext.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonNext.Location = new System.Drawing.Point(826, 102);
            buttonNext.Name = "buttonNext";
            buttonNext.Size = new System.Drawing.Size(76, 31);
            buttonNext.TabIndex = 43;
            buttonNext.Text = "Next";
            buttonNext.UseVisualStyleBackColor = false;
            buttonNext.Click += buttonNext_Click;
            // 
            // labelAbsentNumber
            // 
            labelAbsentNumber.BackColor = System.Drawing.Color.DarkSlateGray;
            labelAbsentNumber.Font = new System.Drawing.Font("Segoe UI", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelAbsentNumber.ForeColor = System.Drawing.Color.White;
            labelAbsentNumber.Location = new System.Drawing.Point(7, 231);
            labelAbsentNumber.Name = "labelAbsentNumber";
            labelAbsentNumber.Size = new System.Drawing.Size(895, 158);
            labelAbsentNumber.TabIndex = 44;
            labelAbsentNumber.Text = "Absent Number: 0";
            labelAbsentNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // comboBoxSemester
            // 
            comboBoxSemester.FormattingEnabled = true;
            comboBoxSemester.Items.AddRange(new object[] { "Autumn", "Spring" });
            comboBoxSemester.Location = new System.Drawing.Point(204, 27);
            comboBoxSemester.Name = "comboBoxSemester";
            comboBoxSemester.Size = new System.Drawing.Size(157, 23);
            comboBoxSemester.TabIndex = 48;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            // 
            // comboBoxSubject
            // 
            comboBoxSubject.FormattingEnabled = true;
            comboBoxSubject.Location = new System.Drawing.Point(396, 27);
            comboBoxSubject.Name = "comboBoxSubject";
            comboBoxSubject.Size = new System.Drawing.Size(196, 23);
            comboBoxSubject.TabIndex = 49;
            comboBoxSubject.SelectedIndexChanged += comboBoxSubject_SelectedIndexChanged;
            // 
            // labelSubject
            // 
            labelSubject.AutoSize = true;
            labelSubject.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSubject.Location = new System.Drawing.Point(396, 4);
            labelSubject.Name = "labelSubject";
            labelSubject.Size = new System.Drawing.Size(60, 20);
            labelSubject.TabIndex = 50;
            labelSubject.Text = "Subject";
            // 
            // comboBoxCourse
            // 
            comboBoxCourse.FormattingEnabled = true;
            comboBoxCourse.Items.AddRange(new object[] { "1", "2", "3", "4" });
            comboBoxCourse.Location = new System.Drawing.Point(12, 27);
            comboBoxCourse.Name = "comboBoxCourse";
            comboBoxCourse.Size = new System.Drawing.Size(157, 23);
            comboBoxCourse.TabIndex = 47;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            // 
            // labelSemester
            // 
            labelSemester.AutoSize = true;
            labelSemester.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSemester.Location = new System.Drawing.Point(204, 4);
            labelSemester.Name = "labelSemester";
            labelSemester.Size = new System.Drawing.Size(74, 20);
            labelSemester.TabIndex = 52;
            labelSemester.Text = "Semester";
            // 
            // labelCourse
            // 
            labelCourse.AutoSize = true;
            labelCourse.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelCourse.Location = new System.Drawing.Point(12, 4);
            labelCourse.Name = "labelCourse";
            labelCourse.Size = new System.Drawing.Size(57, 20);
            labelCourse.TabIndex = 51;
            labelCourse.Text = "Course";
            // 
            // PageParticipation
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoScroll = true;
            BackColor = System.Drawing.Color.Lavender;
            Controls.Add(comboBoxSemester);
            Controls.Add(comboBoxSubject);
            Controls.Add(labelSubject);
            Controls.Add(comboBoxCourse);
            Controls.Add(labelSemester);
            Controls.Add(labelCourse);
            Controls.Add(labelAbsentNumber);
            Controls.Add(buttonBack);
            Controls.Add(buttonNext);
            Controls.Add(dataGridViewParticipates);
            Name = "PageParticipation";
            Size = new System.Drawing.Size(1349, 635);
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridViewParticipates;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonNext;
        private System.Windows.Forms.Label labelAbsentNumber;
        private System.Windows.Forms.ComboBox comboBoxCourse;
        private System.Windows.Forms.ComboBox comboBoxSemester;
        private System.Windows.Forms.ComboBox comboBoxSubject;
        private System.Windows.Forms.Label labelSubject;
        private System.Windows.Forms.Label labelSemester;
        private System.Windows.Forms.Label labelCourse;
    }
}
