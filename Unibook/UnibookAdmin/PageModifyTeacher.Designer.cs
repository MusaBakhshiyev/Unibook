namespace Unibook.UnibookAdmin
{
    partial class PageModifyTeacher
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
            panelModifyTeachers = new System.Windows.Forms.Panel();
            dataGridViewTeacherSubjects = new System.Windows.Forms.DataGridView();
            checkedListBoxSubjects = new System.Windows.Forms.CheckedListBox();
            comboBoxGender = new System.Windows.Forms.ComboBox();
            labelGender = new System.Windows.Forms.Label();
            textBoxPhoneNumber = new System.Windows.Forms.TextBox();
            labelPhoneNumber = new System.Windows.Forms.Label();
            textBoxEMail = new System.Windows.Forms.TextBox();
            labelEMail = new System.Windows.Forms.Label();
            textBoxPassword = new System.Windows.Forms.TextBox();
            textBoxUsername = new System.Windows.Forms.TextBox();
            labelPassword = new System.Windows.Forms.Label();
            labelUsername = new System.Windows.Forms.Label();
            buttonDelete = new System.Windows.Forms.Button();
            buttonUpdate = new System.Windows.Forms.Button();
            buttonClear = new System.Windows.Forms.Button();
            buttonAdd = new System.Windows.Forms.Button();
            dateTimePickerDateOfBirth = new System.Windows.Forms.DateTimePicker();
            dataGridViewTeachers = new System.Windows.Forms.DataGridView();
            textBoxFatherName = new System.Windows.Forms.TextBox();
            textBoxSurname = new System.Windows.Forms.TextBox();
            labelSubjects = new System.Windows.Forms.Label();
            label1 = new System.Windows.Forms.Label();
            labelFatherName = new System.Windows.Forms.Label();
            labelSurname = new System.Windows.Forms.Label();
            textBoxName = new System.Windows.Forms.TextBox();
            labelName = new System.Windows.Forms.Label();
            SubjectName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            panelModifyTeachers.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewTeacherSubjects).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewTeachers).BeginInit();
            SuspendLayout();
            // 
            // panelModifyTeachers
            // 
            panelModifyTeachers.AutoScroll = true;
            panelModifyTeachers.Controls.Add(dataGridViewTeacherSubjects);
            panelModifyTeachers.Controls.Add(checkedListBoxSubjects);
            panelModifyTeachers.Controls.Add(comboBoxGender);
            panelModifyTeachers.Controls.Add(labelGender);
            panelModifyTeachers.Controls.Add(textBoxPhoneNumber);
            panelModifyTeachers.Controls.Add(labelPhoneNumber);
            panelModifyTeachers.Controls.Add(textBoxEMail);
            panelModifyTeachers.Controls.Add(labelEMail);
            panelModifyTeachers.Controls.Add(textBoxPassword);
            panelModifyTeachers.Controls.Add(textBoxUsername);
            panelModifyTeachers.Controls.Add(labelPassword);
            panelModifyTeachers.Controls.Add(labelUsername);
            panelModifyTeachers.Controls.Add(buttonDelete);
            panelModifyTeachers.Controls.Add(buttonUpdate);
            panelModifyTeachers.Controls.Add(buttonClear);
            panelModifyTeachers.Controls.Add(buttonAdd);
            panelModifyTeachers.Controls.Add(dateTimePickerDateOfBirth);
            panelModifyTeachers.Controls.Add(dataGridViewTeachers);
            panelModifyTeachers.Controls.Add(textBoxFatherName);
            panelModifyTeachers.Controls.Add(textBoxSurname);
            panelModifyTeachers.Controls.Add(labelSubjects);
            panelModifyTeachers.Controls.Add(label1);
            panelModifyTeachers.Controls.Add(labelFatherName);
            panelModifyTeachers.Controls.Add(labelSurname);
            panelModifyTeachers.Controls.Add(textBoxName);
            panelModifyTeachers.Controls.Add(labelName);
            panelModifyTeachers.Dock = System.Windows.Forms.DockStyle.Fill;
            panelModifyTeachers.Location = new System.Drawing.Point(0, 0);
            panelModifyTeachers.Name = "panelModifyTeachers";
            panelModifyTeachers.Size = new System.Drawing.Size(1168, 610);
            panelModifyTeachers.TabIndex = 0;
            // 
            // dataGridViewTeacherSubjects
            // 
            dataGridViewTeacherSubjects.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewTeacherSubjects.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            dataGridViewTeacherSubjects.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewTeacherSubjects.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] { SubjectName });
            dataGridViewTeacherSubjects.Location = new System.Drawing.Point(946, 0);
            dataGridViewTeacherSubjects.Name = "dataGridViewTeacherSubjects";
            dataGridViewTeacherSubjects.RowHeadersWidth = 30;
            dataGridViewTeacherSubjects.RowTemplate.Height = 25;
            dataGridViewTeacherSubjects.Size = new System.Drawing.Size(219, 312);
            dataGridViewTeacherSubjects.TabIndex = 0;
            // 
            // checkedListBoxSubjects
            // 
            checkedListBoxSubjects.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            checkedListBoxSubjects.CheckOnClick = true;
            checkedListBoxSubjects.FormattingEnabled = true;
            checkedListBoxSubjects.Location = new System.Drawing.Point(875, 465);
            checkedListBoxSubjects.Name = "checkedListBoxSubjects";
            checkedListBoxSubjects.Size = new System.Drawing.Size(220, 128);
            checkedListBoxSubjects.TabIndex = 10;
            // 
            // comboBoxGender
            // 
            comboBoxGender.FormattingEnabled = true;
            comboBoxGender.Items.AddRange(new object[] { "Male", "Female" });
            comboBoxGender.Location = new System.Drawing.Point(875, 377);
            comboBoxGender.Name = "comboBoxGender";
            comboBoxGender.Size = new System.Drawing.Size(220, 23);
            comboBoxGender.TabIndex = 5;
            // 
            // labelGender
            // 
            labelGender.AutoSize = true;
            labelGender.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGender.Location = new System.Drawing.Point(875, 354);
            labelGender.Name = "labelGender";
            labelGender.Size = new System.Drawing.Size(60, 20);
            labelGender.TabIndex = 0;
            labelGender.Text = "Gender";
            // 
            // textBoxPhoneNumber
            // 
            textBoxPhoneNumber.Location = new System.Drawing.Point(414, 465);
            textBoxPhoneNumber.Name = "textBoxPhoneNumber";
            textBoxPhoneNumber.Size = new System.Drawing.Size(141, 23);
            textBoxPhoneNumber.TabIndex = 8;
            // 
            // labelPhoneNumber
            // 
            labelPhoneNumber.AutoSize = true;
            labelPhoneNumber.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelPhoneNumber.Location = new System.Drawing.Point(414, 442);
            labelPhoneNumber.Name = "labelPhoneNumber";
            labelPhoneNumber.Size = new System.Drawing.Size(111, 20);
            labelPhoneNumber.TabIndex = 0;
            labelPhoneNumber.Text = "PhoneNumber";
            // 
            // textBoxEMail
            // 
            textBoxEMail.Location = new System.Drawing.Point(615, 465);
            textBoxEMail.Name = "textBoxEMail";
            textBoxEMail.Size = new System.Drawing.Size(200, 23);
            textBoxEMail.TabIndex = 9;
            // 
            // labelEMail
            // 
            labelEMail.AutoSize = true;
            labelEMail.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelEMail.Location = new System.Drawing.Point(615, 442);
            labelEMail.Name = "labelEMail";
            labelEMail.Size = new System.Drawing.Size(53, 20);
            labelEMail.TabIndex = 0;
            labelEMail.Text = "E-Mail";
            // 
            // textBoxPassword
            // 
            textBoxPassword.Location = new System.Drawing.Point(212, 465);
            textBoxPassword.Name = "textBoxPassword";
            textBoxPassword.Size = new System.Drawing.Size(141, 23);
            textBoxPassword.TabIndex = 7;
            // 
            // textBoxUsername
            // 
            textBoxUsername.Location = new System.Drawing.Point(12, 465);
            textBoxUsername.Name = "textBoxUsername";
            textBoxUsername.Size = new System.Drawing.Size(141, 23);
            textBoxUsername.TabIndex = 6;
            // 
            // labelPassword
            // 
            labelPassword.AutoSize = true;
            labelPassword.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelPassword.Location = new System.Drawing.Point(212, 442);
            labelPassword.Name = "labelPassword";
            labelPassword.Size = new System.Drawing.Size(76, 20);
            labelPassword.TabIndex = 0;
            labelPassword.Text = "Password";
            // 
            // labelUsername
            // 
            labelUsername.AutoSize = true;
            labelUsername.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelUsername.Location = new System.Drawing.Point(12, 442);
            labelUsername.Name = "labelUsername";
            labelUsername.Size = new System.Drawing.Size(80, 20);
            labelUsername.TabIndex = 0;
            labelUsername.Text = "Username";
            // 
            // buttonDelete
            // 
            buttonDelete.BackColor = System.Drawing.Color.Red;
            buttonDelete.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonDelete.ForeColor = System.Drawing.Color.White;
            buttonDelete.Location = new System.Drawing.Point(115, 563);
            buttonDelete.Name = "buttonDelete";
            buttonDelete.Size = new System.Drawing.Size(87, 35);
            buttonDelete.TabIndex = 13;
            buttonDelete.Text = "Delete";
            buttonDelete.UseVisualStyleBackColor = false;
            buttonDelete.Click += buttonDelete_Click;
            // 
            // buttonUpdate
            // 
            buttonUpdate.BackColor = System.Drawing.Color.FromArgb(0, 192, 0);
            buttonUpdate.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonUpdate.ForeColor = System.Drawing.Color.White;
            buttonUpdate.Location = new System.Drawing.Point(218, 563);
            buttonUpdate.Name = "buttonUpdate";
            buttonUpdate.Size = new System.Drawing.Size(87, 35);
            buttonUpdate.TabIndex = 14;
            buttonUpdate.Text = "Update";
            buttonUpdate.UseVisualStyleBackColor = false;
            buttonUpdate.Click += buttonUpdate_Click;
            // 
            // buttonClear
            // 
            buttonClear.BackColor = System.Drawing.Color.IndianRed;
            buttonClear.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonClear.ForeColor = System.Drawing.Color.White;
            buttonClear.Location = new System.Drawing.Point(12, 512);
            buttonClear.Name = "buttonClear";
            buttonClear.Size = new System.Drawing.Size(87, 35);
            buttonClear.TabIndex = 11;
            buttonClear.Text = "Clear";
            buttonClear.UseVisualStyleBackColor = false;
            buttonClear.Click += buttonClear_Click;
            // 
            // buttonAdd
            // 
            buttonAdd.BackColor = System.Drawing.Color.Blue;
            buttonAdd.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonAdd.ForeColor = System.Drawing.Color.White;
            buttonAdd.Location = new System.Drawing.Point(12, 563);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new System.Drawing.Size(87, 35);
            buttonAdd.TabIndex = 12;
            buttonAdd.Text = "Add";
            buttonAdd.UseVisualStyleBackColor = false;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // dateTimePickerDateOfBirth
            // 
            dateTimePickerDateOfBirth.Location = new System.Drawing.Point(615, 377);
            dateTimePickerDateOfBirth.Name = "dateTimePickerDateOfBirth";
            dateTimePickerDateOfBirth.Size = new System.Drawing.Size(200, 23);
            dateTimePickerDateOfBirth.TabIndex = 4;
            // 
            // dataGridViewTeachers
            // 
            dataGridViewTeachers.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridViewTeachers.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewTeachers.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            dataGridViewTeachers.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewTeachers.Location = new System.Drawing.Point(0, 0);
            dataGridViewTeachers.Name = "dataGridViewTeachers";
            dataGridViewTeachers.RowHeadersWidth = 30;
            dataGridViewTeachers.RowTemplate.Height = 25;
            dataGridViewTeachers.Size = new System.Drawing.Size(942, 312);
            dataGridViewTeachers.TabIndex = 0;
            dataGridViewTeachers.CellClick += dataGridViewTeachers_CellClick;
            // 
            // textBoxFatherName
            // 
            textBoxFatherName.Location = new System.Drawing.Point(414, 377);
            textBoxFatherName.Name = "textBoxFatherName";
            textBoxFatherName.Size = new System.Drawing.Size(141, 23);
            textBoxFatherName.TabIndex = 3;
            // 
            // textBoxSurname
            // 
            textBoxSurname.Location = new System.Drawing.Point(213, 377);
            textBoxSurname.Name = "textBoxSurname";
            textBoxSurname.Size = new System.Drawing.Size(141, 23);
            textBoxSurname.TabIndex = 2;
            // 
            // labelSubjects
            // 
            labelSubjects.AutoSize = true;
            labelSubjects.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSubjects.Location = new System.Drawing.Point(875, 442);
            labelSubjects.Name = "labelSubjects";
            labelSubjects.Size = new System.Drawing.Size(67, 20);
            labelSubjects.TabIndex = 0;
            labelSubjects.Text = "Subjects";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            label1.Location = new System.Drawing.Point(615, 354);
            label1.Name = "label1";
            label1.Size = new System.Drawing.Size(102, 20);
            label1.TabIndex = 0;
            label1.Text = "Date Of Birth";
            // 
            // labelFatherName
            // 
            labelFatherName.AutoSize = true;
            labelFatherName.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelFatherName.Location = new System.Drawing.Point(416, 354);
            labelFatherName.Name = "labelFatherName";
            labelFatherName.Size = new System.Drawing.Size(100, 20);
            labelFatherName.TabIndex = 0;
            labelFatherName.Text = "Father Name";
            // 
            // labelSurname
            // 
            labelSurname.AutoSize = true;
            labelSurname.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSurname.Location = new System.Drawing.Point(212, 354);
            labelSurname.Name = "labelSurname";
            labelSurname.Size = new System.Drawing.Size(71, 20);
            labelSurname.TabIndex = 0;
            labelSurname.Text = "Surname";
            // 
            // textBoxName
            // 
            textBoxName.Location = new System.Drawing.Point(12, 377);
            textBoxName.Name = "textBoxName";
            textBoxName.Size = new System.Drawing.Size(141, 23);
            textBoxName.TabIndex = 1;
            // 
            // labelName
            // 
            labelName.AutoSize = true;
            labelName.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelName.Location = new System.Drawing.Point(12, 354);
            labelName.Name = "labelName";
            labelName.Size = new System.Drawing.Size(51, 20);
            labelName.TabIndex = 0;
            labelName.Text = "Name";
            // 
            // SubjectName
            // 
            SubjectName.HeaderText = "SubjectName";
            SubjectName.Name = "SubjectName";
            SubjectName.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            SubjectName.Width = 187;
            // 
            // PageModifyTeacher
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelModifyTeachers);
            Name = "PageModifyTeacher";
            Size = new System.Drawing.Size(1168, 610);
            Load += PageModifyTeacher_Load;
            panelModifyTeachers.ResumeLayout(false);
            panelModifyTeachers.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewTeacherSubjects).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewTeachers).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel panelModifyTeachers;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label labelName;
        private System.Windows.Forms.DataGridView dataGridViewTeachers;
        private System.Windows.Forms.TextBox textBoxFatherName;
        private System.Windows.Forms.TextBox textBoxSurname;
        private System.Windows.Forms.Label labelFatherName;
        private System.Windows.Forms.Label labelSurname;
        private System.Windows.Forms.DateTimePicker dateTimePickerDateOfBirth;
        private System.Windows.Forms.Label labelSubjects;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonClear;
        private System.Windows.Forms.TextBox textBoxPhoneNumber;
        private System.Windows.Forms.Label labelPhoneNumber;
        private System.Windows.Forms.Label labelEMail;
        private System.Windows.Forms.TextBox textBoxPassword;
        private System.Windows.Forms.TextBox textBoxUsername;
        private System.Windows.Forms.Label labelPassword;
        private System.Windows.Forms.Label labelUsername;
        private System.Windows.Forms.ComboBox comboBoxGender;
        private System.Windows.Forms.Label labelGender;
        private System.Windows.Forms.CheckedListBox checkedListBoxSubjects;
        private System.Windows.Forms.TextBox textBoxEMail;
        private System.Windows.Forms.DataGridView dataGridViewTeacherSubjects;
        private System.Windows.Forms.DataGridViewTextBoxColumn SubjectName;
    }
}
