namespace Unibook.UnibookAdmin
{
    partial class PageModifyParticipates
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
            panelModifyParticipates = new System.Windows.Forms.Panel();
            buttonBack = new System.Windows.Forms.Button();
            buttonNext = new System.Windows.Forms.Button();
            labelGroup = new System.Windows.Forms.Label();
            comboBoxGroupName = new System.Windows.Forms.ComboBox();
            comboBoxCourse = new System.Windows.Forms.ComboBox();
            labelCourse = new System.Windows.Forms.Label();
            labelSemester = new System.Windows.Forms.Label();
            comboBoxSemester = new System.Windows.Forms.ComboBox();
            labelSubject = new System.Windows.Forms.Label();
            comboBoxSubject = new System.Windows.Forms.ComboBox();
            dataGridViewParticipates = new System.Windows.Forms.DataGridView();
            panelModifyParticipates.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).BeginInit();
            SuspendLayout();
            // 
            // panelModifyParticipates
            // 
            panelModifyParticipates.AutoScroll = true;
            panelModifyParticipates.Controls.Add(buttonBack);
            panelModifyParticipates.Controls.Add(buttonNext);
            panelModifyParticipates.Controls.Add(labelGroup);
            panelModifyParticipates.Controls.Add(comboBoxGroupName);
            panelModifyParticipates.Controls.Add(comboBoxCourse);
            panelModifyParticipates.Controls.Add(labelCourse);
            panelModifyParticipates.Controls.Add(labelSemester);
            panelModifyParticipates.Controls.Add(comboBoxSemester);
            panelModifyParticipates.Controls.Add(labelSubject);
            panelModifyParticipates.Controls.Add(comboBoxSubject);
            panelModifyParticipates.Controls.Add(dataGridViewParticipates);
            panelModifyParticipates.Dock = System.Windows.Forms.DockStyle.Fill;
            panelModifyParticipates.Location = new System.Drawing.Point(0, 0);
            panelModifyParticipates.Name = "panelModifyParticipates";
            panelModifyParticipates.Size = new System.Drawing.Size(1168, 610);
            panelModifyParticipates.TabIndex = 1;
            // 
            // buttonBack
            // 
            buttonBack.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonBack.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonBack.Location = new System.Drawing.Point(21, 159);
            buttonBack.Name = "buttonBack";
            buttonBack.Size = new System.Drawing.Size(76, 31);
            buttonBack.TabIndex = 41;
            buttonBack.Text = "Back";
            buttonBack.UseVisualStyleBackColor = false;
            buttonBack.Click += buttonBack_Click;
            // 
            // buttonNext
            // 
            buttonNext.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonNext.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonNext.Location = new System.Drawing.Point(909, 159);
            buttonNext.Name = "buttonNext";
            buttonNext.Size = new System.Drawing.Size(76, 31);
            buttonNext.TabIndex = 41;
            buttonNext.Text = "Next";
            buttonNext.UseVisualStyleBackColor = false;
            buttonNext.Click += buttonNext_Click;
            // 
            // labelGroup
            // 
            labelGroup.AutoSize = true;
            labelGroup.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGroup.Location = new System.Drawing.Point(21, 11);
            labelGroup.Name = "labelGroup";
            labelGroup.Size = new System.Drawing.Size(53, 20);
            labelGroup.TabIndex = 38;
            labelGroup.Text = "Group";
            // 
            // comboBoxGroupName
            // 
            comboBoxGroupName.FormattingEnabled = true;
            comboBoxGroupName.Location = new System.Drawing.Point(21, 34);
            comboBoxGroupName.Name = "comboBoxGroupName";
            comboBoxGroupName.Size = new System.Drawing.Size(157, 23);
            comboBoxGroupName.TabIndex = 33;
            comboBoxGroupName.SelectedIndexChanged += comboBoxGroupName_SelectedIndexChanged;
            // 
            // comboBoxCourse
            // 
            comboBoxCourse.FormattingEnabled = true;
            comboBoxCourse.Items.AddRange(new object[] { "1", "2", "3", "4" });
            comboBoxCourse.Location = new System.Drawing.Point(213, 34);
            comboBoxCourse.Name = "comboBoxCourse";
            comboBoxCourse.Size = new System.Drawing.Size(157, 23);
            comboBoxCourse.TabIndex = 34;
            comboBoxCourse.SelectedIndexChanged += comboBoxCourse_SelectedIndexChanged;
            // 
            // labelCourse
            // 
            labelCourse.AutoSize = true;
            labelCourse.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelCourse.Location = new System.Drawing.Point(213, 11);
            labelCourse.Name = "labelCourse";
            labelCourse.Size = new System.Drawing.Size(57, 20);
            labelCourse.TabIndex = 39;
            labelCourse.Text = "Course";
            // 
            // labelSemester
            // 
            labelSemester.AutoSize = true;
            labelSemester.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSemester.Location = new System.Drawing.Point(405, 11);
            labelSemester.Name = "labelSemester";
            labelSemester.Size = new System.Drawing.Size(74, 20);
            labelSemester.TabIndex = 40;
            labelSemester.Text = "Semester";
            // 
            // comboBoxSemester
            // 
            comboBoxSemester.FormattingEnabled = true;
            comboBoxSemester.Items.AddRange(new object[] { "Autumn", "Spring" });
            comboBoxSemester.Location = new System.Drawing.Point(405, 34);
            comboBoxSemester.Name = "comboBoxSemester";
            comboBoxSemester.Size = new System.Drawing.Size(157, 23);
            comboBoxSemester.TabIndex = 35;
            comboBoxSemester.SelectedIndexChanged += comboBoxSemester_SelectedIndexChanged;
            // 
            // labelSubject
            // 
            labelSubject.AutoSize = true;
            labelSubject.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSubject.Location = new System.Drawing.Point(597, 11);
            labelSubject.Name = "labelSubject";
            labelSubject.Size = new System.Drawing.Size(60, 20);
            labelSubject.TabIndex = 37;
            labelSubject.Text = "Subject";
            // 
            // comboBoxSubject
            // 
            comboBoxSubject.FormattingEnabled = true;
            comboBoxSubject.Location = new System.Drawing.Point(597, 34);
            comboBoxSubject.Name = "comboBoxSubject";
            comboBoxSubject.Size = new System.Drawing.Size(196, 23);
            comboBoxSubject.TabIndex = 36;
            comboBoxSubject.SelectedIndexChanged += comboBoxSubject_SelectedIndexChanged;
            // 
            // dataGridViewParticipates
            // 
            dataGridViewParticipates.AllowUserToAddRows = false;
            dataGridViewParticipates.AllowUserToDeleteRows = false;
            dataGridViewParticipates.AllowUserToResizeColumns = false;
            dataGridViewParticipates.AllowUserToResizeRows = false;
            dataGridViewParticipates.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewParticipates.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewParticipates.Location = new System.Drawing.Point(21, 196);
            dataGridViewParticipates.Name = "dataGridViewParticipates";
            dataGridViewParticipates.RowHeadersVisible = false;
            dataGridViewParticipates.RowTemplate.Height = 30;
            dataGridViewParticipates.Size = new System.Drawing.Size(964, 411);
            dataGridViewParticipates.TabIndex = 0;
            dataGridViewParticipates.CellEndEdit += dataGridViewParticipates_CellEndEdit;
            // 
            // PageModifyParticipates
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelModifyParticipates);
            Name = "PageModifyParticipates";
            Size = new System.Drawing.Size(1168, 610);
            panelModifyParticipates.ResumeLayout(false);
            panelModifyParticipates.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private System.Windows.Forms.Panel panelModifyParticipates;
        private System.Windows.Forms.Label labelGroup;
        private System.Windows.Forms.ComboBox comboBoxGroupName;
        private System.Windows.Forms.ComboBox comboBoxCourse;
        private System.Windows.Forms.Label labelCourse;
        private System.Windows.Forms.Label labelSemester;
        private System.Windows.Forms.ComboBox comboBoxSemester;
        private System.Windows.Forms.Label labelSubject;
        private System.Windows.Forms.ComboBox comboBoxSubject;
        private System.Windows.Forms.DataGridView dataGridViewParticipates;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonNext;
    }
}
