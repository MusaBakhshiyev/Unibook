namespace Unibook.UnibookAdmin
{
    partial class PageModifyGroup
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
            panelModifyGroups = new System.Windows.Forms.Panel();
            textBoxYear = new System.Windows.Forms.TextBox();
            labelYear = new System.Windows.Forms.Label();
            dataGridViewStudents = new System.Windows.Forms.DataGridView();
            buttonDelete = new System.Windows.Forms.Button();
            buttonUpdate = new System.Windows.Forms.Button();
            buttonClear = new System.Windows.Forms.Button();
            buttonAdd = new System.Windows.Forms.Button();
            textBoxMaxCount = new System.Windows.Forms.TextBox();
            labelMaxCount = new System.Windows.Forms.Label();
            comboBoxDepartment = new System.Windows.Forms.ComboBox();
            labelDepartment = new System.Windows.Forms.Label();
            comboBoxMajor = new System.Windows.Forms.ComboBox();
            labelMajor = new System.Windows.Forms.Label();
            textBoxName = new System.Windows.Forms.TextBox();
            labelName = new System.Windows.Forms.Label();
            dataGridViewGroups = new System.Windows.Forms.DataGridView();
            panelModifyGroups.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGroups).BeginInit();
            SuspendLayout();
            // 
            // panelModifyGroups
            // 
            panelModifyGroups.AutoScroll = true;
            panelModifyGroups.Controls.Add(textBoxYear);
            panelModifyGroups.Controls.Add(labelYear);
            panelModifyGroups.Controls.Add(dataGridViewStudents);
            panelModifyGroups.Controls.Add(buttonDelete);
            panelModifyGroups.Controls.Add(buttonUpdate);
            panelModifyGroups.Controls.Add(buttonClear);
            panelModifyGroups.Controls.Add(buttonAdd);
            panelModifyGroups.Controls.Add(textBoxMaxCount);
            panelModifyGroups.Controls.Add(labelMaxCount);
            panelModifyGroups.Controls.Add(comboBoxDepartment);
            panelModifyGroups.Controls.Add(labelDepartment);
            panelModifyGroups.Controls.Add(comboBoxMajor);
            panelModifyGroups.Controls.Add(labelMajor);
            panelModifyGroups.Controls.Add(textBoxName);
            panelModifyGroups.Controls.Add(labelName);
            panelModifyGroups.Controls.Add(dataGridViewGroups);
            panelModifyGroups.Dock = System.Windows.Forms.DockStyle.Fill;
            panelModifyGroups.Location = new System.Drawing.Point(0, 0);
            panelModifyGroups.Name = "panelModifyGroups";
            panelModifyGroups.Size = new System.Drawing.Size(1168, 650);
            panelModifyGroups.TabIndex = 0;
            // 
            // textBoxYear
            // 
            textBoxYear.Location = new System.Drawing.Point(187, 111);
            textBoxYear.Name = "textBoxYear";
            textBoxYear.Size = new System.Drawing.Size(116, 23);
            textBoxYear.TabIndex = 5;
            // 
            // labelYear
            // 
            labelYear.AutoSize = true;
            labelYear.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelYear.Location = new System.Drawing.Point(187, 88);
            labelYear.Name = "labelYear";
            labelYear.Size = new System.Drawing.Size(39, 20);
            labelYear.TabIndex = 24;
            labelYear.Text = "Year";
            // 
            // dataGridViewStudents
            // 
            dataGridViewStudents.AllowUserToResizeColumns = false;
            dataGridViewStudents.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridViewStudents.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewStudents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewStudents.Dock = System.Windows.Forms.DockStyle.Bottom;
            dataGridViewStudents.Location = new System.Drawing.Point(0, 260);
            dataGridViewStudents.Name = "dataGridViewStudents";
            dataGridViewStudents.RowHeadersWidth = 30;
            dataGridViewStudents.RowTemplate.Height = 25;
            dataGridViewStudents.Size = new System.Drawing.Size(1168, 390);
            dataGridViewStudents.TabIndex = 22;
            // 
            // buttonDelete
            // 
            buttonDelete.BackColor = System.Drawing.Color.Red;
            buttonDelete.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonDelete.ForeColor = System.Drawing.Color.White;
            buttonDelete.Location = new System.Drawing.Point(133, 217);
            buttonDelete.Name = "buttonDelete";
            buttonDelete.Size = new System.Drawing.Size(100, 37);
            buttonDelete.TabIndex = 8;
            buttonDelete.Text = "Delete";
            buttonDelete.UseVisualStyleBackColor = false;
            buttonDelete.Click += buttonDelete_Click;
            // 
            // buttonUpdate
            // 
            buttonUpdate.BackColor = System.Drawing.Color.FromArgb(0, 192, 0);
            buttonUpdate.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonUpdate.ForeColor = System.Drawing.Color.White;
            buttonUpdate.Location = new System.Drawing.Point(254, 217);
            buttonUpdate.Name = "buttonUpdate";
            buttonUpdate.Size = new System.Drawing.Size(100, 37);
            buttonUpdate.TabIndex = 9;
            buttonUpdate.Text = "Update";
            buttonUpdate.UseVisualStyleBackColor = false;
            buttonUpdate.Click += buttonUpdate_Click;
            // 
            // buttonClear
            // 
            buttonClear.BackColor = System.Drawing.Color.IndianRed;
            buttonClear.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonClear.ForeColor = System.Drawing.Color.White;
            buttonClear.Location = new System.Drawing.Point(13, 160);
            buttonClear.Name = "buttonClear";
            buttonClear.Size = new System.Drawing.Size(100, 37);
            buttonClear.TabIndex = 6;
            buttonClear.Text = "Clear";
            buttonClear.UseVisualStyleBackColor = false;
            buttonClear.Click += buttonClear_Click;
            // 
            // buttonAdd
            // 
            buttonAdd.BackColor = System.Drawing.Color.Blue;
            buttonAdd.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonAdd.ForeColor = System.Drawing.Color.White;
            buttonAdd.Location = new System.Drawing.Point(13, 217);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new System.Drawing.Size(100, 37);
            buttonAdd.TabIndex = 7;
            buttonAdd.Text = "Add";
            buttonAdd.UseVisualStyleBackColor = false;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // textBoxMaxCount
            // 
            textBoxMaxCount.Location = new System.Drawing.Point(13, 111);
            textBoxMaxCount.Name = "textBoxMaxCount";
            textBoxMaxCount.Size = new System.Drawing.Size(118, 23);
            textBoxMaxCount.TabIndex = 4;
            // 
            // labelMaxCount
            // 
            labelMaxCount.AutoSize = true;
            labelMaxCount.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelMaxCount.Location = new System.Drawing.Point(13, 88);
            labelMaxCount.Name = "labelMaxCount";
            labelMaxCount.Size = new System.Drawing.Size(85, 20);
            labelMaxCount.TabIndex = 9;
            labelMaxCount.Text = "Max Count";
            // 
            // comboBoxDepartment
            // 
            comboBoxDepartment.FormattingEnabled = true;
            comboBoxDepartment.Items.AddRange(new object[] { "Azerbaijani", "English" });
            comboBoxDepartment.Location = new System.Drawing.Point(405, 35);
            comboBoxDepartment.Name = "comboBoxDepartment";
            comboBoxDepartment.Size = new System.Drawing.Size(162, 23);
            comboBoxDepartment.TabIndex = 3;
            // 
            // labelDepartment
            // 
            labelDepartment.AutoSize = true;
            labelDepartment.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelDepartment.Location = new System.Drawing.Point(405, 12);
            labelDepartment.Name = "labelDepartment";
            labelDepartment.Size = new System.Drawing.Size(94, 20);
            labelDepartment.TabIndex = 0;
            labelDepartment.Text = "Department";
            // 
            // comboBoxMajor
            // 
            comboBoxMajor.FormattingEnabled = true;
            comboBoxMajor.Items.AddRange(new object[] { "Computer Engineering", "Computer Science" });
            comboBoxMajor.Location = new System.Drawing.Point(187, 35);
            comboBoxMajor.Name = "comboBoxMajor";
            comboBoxMajor.Size = new System.Drawing.Size(162, 23);
            comboBoxMajor.TabIndex = 2;
            // 
            // labelMajor
            // 
            labelMajor.AutoSize = true;
            labelMajor.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelMajor.Location = new System.Drawing.Point(187, 12);
            labelMajor.Name = "labelMajor";
            labelMajor.Size = new System.Drawing.Size(50, 20);
            labelMajor.TabIndex = 0;
            labelMajor.Text = "Major";
            // 
            // textBoxName
            // 
            textBoxName.Location = new System.Drawing.Point(13, 35);
            textBoxName.Name = "textBoxName";
            textBoxName.Size = new System.Drawing.Size(118, 23);
            textBoxName.TabIndex = 1;
            // 
            // labelName
            // 
            labelName.AutoSize = true;
            labelName.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelName.Location = new System.Drawing.Point(13, 12);
            labelName.Name = "labelName";
            labelName.Size = new System.Drawing.Size(51, 20);
            labelName.TabIndex = 0;
            labelName.Text = "Name";
            // 
            // dataGridViewGroups
            // 
            dataGridViewGroups.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridViewGroups.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewGroups.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewGroups.Location = new System.Drawing.Point(587, 0);
            dataGridViewGroups.Name = "dataGridViewGroups";
            dataGridViewGroups.RowHeadersWidth = 30;
            dataGridViewGroups.RowTemplate.Height = 25;
            dataGridViewGroups.Size = new System.Drawing.Size(578, 254);
            dataGridViewGroups.TabIndex = 0;
            dataGridViewGroups.CellClick += dataGridViewGroups_CellClick;
            // 
            // PageModifyGroup
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelModifyGroups);
            Name = "PageModifyGroup";
            Size = new System.Drawing.Size(1168, 650);
            Load += PageModifyGroup_Load;
            panelModifyGroups.ResumeLayout(false);
            panelModifyGroups.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGroups).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel panelModifyGroups;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label labelName;
        private System.Windows.Forms.DataGridView dataGridViewGroups;
        private System.Windows.Forms.ComboBox comboBoxMajor;
        private System.Windows.Forms.Label labelMajor;
        private System.Windows.Forms.ComboBox comboBoxDepartment;
        private System.Windows.Forms.Label labelDepartment;
        private System.Windows.Forms.TextBox textBoxMaxCount;
        private System.Windows.Forms.Label labelMaxCount;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonClear;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.DataGridView dataGridViewStudents;
        private System.Windows.Forms.TextBox textBoxYear;
        private System.Windows.Forms.Label labelYear;
    }
}
