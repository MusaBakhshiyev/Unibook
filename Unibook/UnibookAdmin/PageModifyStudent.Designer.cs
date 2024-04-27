namespace Unibook.UnibookAdmin
{
    partial class PageModifyStudent
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
            buttonClear = new System.Windows.Forms.Button();
            buttonAdd = new System.Windows.Forms.Button();
            textBoxPassword = new System.Windows.Forms.TextBox();
            textBoxPhoneNumber = new System.Windows.Forms.TextBox();
            textBoxEMail = new System.Windows.Forms.TextBox();
            textBoxUsername = new System.Windows.Forms.TextBox();
            comboBoxEducationDegree = new System.Windows.Forms.ComboBox();
            comboBoxPaymentType = new System.Windows.Forms.ComboBox();
            comboBoxEducationForm = new System.Windows.Forms.ComboBox();
            comboBoxDepartment = new System.Windows.Forms.ComboBox();
            comboBoxMajor = new System.Windows.Forms.ComboBox();
            textBoxEntranceScore = new System.Windows.Forms.TextBox();
            textBoxFatherName = new System.Windows.Forms.TextBox();
            dateTimePickerDateOfBirth = new System.Windows.Forms.DateTimePicker();
            textBoxSurname = new System.Windows.Forms.TextBox();
            textBoxName = new System.Windows.Forms.TextBox();
            panelModifyStudents = new System.Windows.Forms.Panel();
            comboBoxGroupName = new System.Windows.Forms.ComboBox();
            labelGroup = new System.Windows.Forms.Label();
            dataGridViewStudents = new System.Windows.Forms.DataGridView();
            comboBoxGender = new System.Windows.Forms.ComboBox();
            buttonDelete = new System.Windows.Forms.Button();
            buttonUpdate = new System.Windows.Forms.Button();
            labelPhoneNumber = new System.Windows.Forms.Label();
            labelGender = new System.Windows.Forms.Label();
            labelEMail = new System.Windows.Forms.Label();
            labelPassword = new System.Windows.Forms.Label();
            labelUsername = new System.Windows.Forms.Label();
            labelEducationDegree = new System.Windows.Forms.Label();
            labelPaymentType = new System.Windows.Forms.Label();
            labelEducationForm = new System.Windows.Forms.Label();
            labelDepartment = new System.Windows.Forms.Label();
            labelMajor = new System.Windows.Forms.Label();
            labelEntranceScore = new System.Windows.Forms.Label();
            labelFatherName = new System.Windows.Forms.Label();
            labelDateOfBirth = new System.Windows.Forms.Label();
            labelSurname = new System.Windows.Forms.Label();
            labelName = new System.Windows.Forms.Label();
            panelModifyStudents.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).BeginInit();
            SuspendLayout();
            // 
            // buttonClear
            // 
            buttonClear.BackColor = System.Drawing.Color.IndianRed;
            buttonClear.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonClear.ForeColor = System.Drawing.Color.White;
            buttonClear.Location = new System.Drawing.Point(463, 572);
            buttonClear.Name = "buttonClear";
            buttonClear.Size = new System.Drawing.Size(100, 37);
            buttonClear.TabIndex = 20;
            buttonClear.Text = "Clear";
            buttonClear.UseVisualStyleBackColor = false;
            buttonClear.Click += buttonClear_Click;
            // 
            // buttonAdd
            // 
            buttonAdd.BackColor = System.Drawing.Color.Blue;
            buttonAdd.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonAdd.ForeColor = System.Drawing.Color.White;
            buttonAdd.Location = new System.Drawing.Point(15, 641);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new System.Drawing.Size(100, 37);
            buttonAdd.TabIndex = 17;
            buttonAdd.Text = "Add";
            buttonAdd.UseVisualStyleBackColor = false;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // textBoxPassword
            // 
            textBoxPassword.Location = new System.Drawing.Point(241, 582);
            textBoxPassword.Name = "textBoxPassword";
            textBoxPassword.Size = new System.Drawing.Size(158, 23);
            textBoxPassword.TabIndex = 16;
            // 
            // textBoxPhoneNumber
            // 
            textBoxPhoneNumber.Location = new System.Drawing.Point(463, 479);
            textBoxPhoneNumber.Name = "textBoxPhoneNumber";
            textBoxPhoneNumber.Size = new System.Drawing.Size(160, 23);
            textBoxPhoneNumber.TabIndex = 13;
            // 
            // textBoxEMail
            // 
            textBoxEMail.Location = new System.Drawing.Point(691, 479);
            textBoxEMail.Name = "textBoxEMail";
            textBoxEMail.Size = new System.Drawing.Size(200, 23);
            textBoxEMail.TabIndex = 14;
            // 
            // textBoxUsername
            // 
            textBoxUsername.Location = new System.Drawing.Point(16, 582);
            textBoxUsername.Name = "textBoxUsername";
            textBoxUsername.Size = new System.Drawing.Size(157, 23);
            textBoxUsername.TabIndex = 15;
            // 
            // comboBoxEducationDegree
            // 
            comboBoxEducationDegree.FormattingEnabled = true;
            comboBoxEducationDegree.Items.AddRange(new object[] { "Bachelor", "Master" });
            comboBoxEducationDegree.Location = new System.Drawing.Point(241, 376);
            comboBoxEducationDegree.Name = "comboBoxEducationDegree";
            comboBoxEducationDegree.Size = new System.Drawing.Size(154, 23);
            comboBoxEducationDegree.TabIndex = 7;
            // 
            // comboBoxPaymentType
            // 
            comboBoxPaymentType.FormattingEnabled = true;
            comboBoxPaymentType.Items.AddRange(new object[] { "Government funded", "Paid basis" });
            comboBoxPaymentType.Location = new System.Drawing.Point(15, 376);
            comboBoxPaymentType.Name = "comboBoxPaymentType";
            comboBoxPaymentType.Size = new System.Drawing.Size(158, 23);
            comboBoxPaymentType.TabIndex = 6;
            // 
            // comboBoxEducationForm
            // 
            comboBoxEducationForm.FormattingEnabled = true;
            comboBoxEducationForm.Items.AddRange(new object[] { "Full-time", "Part-time" });
            comboBoxEducationForm.Location = new System.Drawing.Point(463, 376);
            comboBoxEducationForm.Name = "comboBoxEducationForm";
            comboBoxEducationForm.Size = new System.Drawing.Size(160, 23);
            comboBoxEducationForm.TabIndex = 8;
            // 
            // comboBoxDepartment
            // 
            comboBoxDepartment.FormattingEnabled = true;
            comboBoxDepartment.Items.AddRange(new object[] { "Azerbaijani", "English" });
            comboBoxDepartment.Location = new System.Drawing.Point(959, 376);
            comboBoxDepartment.Name = "comboBoxDepartment";
            comboBoxDepartment.Size = new System.Drawing.Size(160, 23);
            comboBoxDepartment.TabIndex = 10;
            // 
            // comboBoxMajor
            // 
            comboBoxMajor.FormattingEnabled = true;
            comboBoxMajor.Items.AddRange(new object[] { "Computer Engineering", "Computer Science" });
            comboBoxMajor.Location = new System.Drawing.Point(691, 376);
            comboBoxMajor.Name = "comboBoxMajor";
            comboBoxMajor.Size = new System.Drawing.Size(200, 23);
            comboBoxMajor.TabIndex = 9;
            comboBoxMajor.SelectedIndexChanged += comboBoxMajor_SelectedIndexChanged;
            // 
            // textBoxEntranceScore
            // 
            textBoxEntranceScore.Location = new System.Drawing.Point(959, 273);
            textBoxEntranceScore.Name = "textBoxEntranceScore";
            textBoxEntranceScore.Size = new System.Drawing.Size(160, 23);
            textBoxEntranceScore.TabIndex = 5;
            // 
            // textBoxFatherName
            // 
            textBoxFatherName.Location = new System.Drawing.Point(463, 273);
            textBoxFatherName.Name = "textBoxFatherName";
            textBoxFatherName.Size = new System.Drawing.Size(160, 23);
            textBoxFatherName.TabIndex = 3;
            // 
            // dateTimePickerDateOfBirth
            // 
            dateTimePickerDateOfBirth.Location = new System.Drawing.Point(691, 273);
            dateTimePickerDateOfBirth.Name = "dateTimePickerDateOfBirth";
            dateTimePickerDateOfBirth.Size = new System.Drawing.Size(200, 23);
            dateTimePickerDateOfBirth.TabIndex = 4;
            // 
            // textBoxSurname
            // 
            textBoxSurname.Location = new System.Drawing.Point(241, 273);
            textBoxSurname.Name = "textBoxSurname";
            textBoxSurname.Size = new System.Drawing.Size(154, 23);
            textBoxSurname.TabIndex = 2;
            // 
            // textBoxName
            // 
            textBoxName.Location = new System.Drawing.Point(15, 273);
            textBoxName.Name = "textBoxName";
            textBoxName.Size = new System.Drawing.Size(158, 23);
            textBoxName.TabIndex = 1;
            // 
            // panelModifyStudents
            // 
            panelModifyStudents.AutoScroll = true;
            panelModifyStudents.AutoScrollMargin = new System.Drawing.Size(0, 20);
            panelModifyStudents.BackColor = System.Drawing.Color.WhiteSmoke;
            panelModifyStudents.Controls.Add(comboBoxGroupName);
            panelModifyStudents.Controls.Add(labelGroup);
            panelModifyStudents.Controls.Add(dataGridViewStudents);
            panelModifyStudents.Controls.Add(comboBoxGender);
            panelModifyStudents.Controls.Add(buttonDelete);
            panelModifyStudents.Controls.Add(buttonUpdate);
            panelModifyStudents.Controls.Add(buttonClear);
            panelModifyStudents.Controls.Add(buttonAdd);
            panelModifyStudents.Controls.Add(textBoxPassword);
            panelModifyStudents.Controls.Add(textBoxPhoneNumber);
            panelModifyStudents.Controls.Add(textBoxEMail);
            panelModifyStudents.Controls.Add(textBoxUsername);
            panelModifyStudents.Controls.Add(comboBoxEducationDegree);
            panelModifyStudents.Controls.Add(comboBoxPaymentType);
            panelModifyStudents.Controls.Add(comboBoxEducationForm);
            panelModifyStudents.Controls.Add(comboBoxDepartment);
            panelModifyStudents.Controls.Add(comboBoxMajor);
            panelModifyStudents.Controls.Add(textBoxEntranceScore);
            panelModifyStudents.Controls.Add(textBoxFatherName);
            panelModifyStudents.Controls.Add(dateTimePickerDateOfBirth);
            panelModifyStudents.Controls.Add(textBoxSurname);
            panelModifyStudents.Controls.Add(textBoxName);
            panelModifyStudents.Controls.Add(labelPhoneNumber);
            panelModifyStudents.Controls.Add(labelGender);
            panelModifyStudents.Controls.Add(labelEMail);
            panelModifyStudents.Controls.Add(labelPassword);
            panelModifyStudents.Controls.Add(labelUsername);
            panelModifyStudents.Controls.Add(labelEducationDegree);
            panelModifyStudents.Controls.Add(labelPaymentType);
            panelModifyStudents.Controls.Add(labelEducationForm);
            panelModifyStudents.Controls.Add(labelDepartment);
            panelModifyStudents.Controls.Add(labelMajor);
            panelModifyStudents.Controls.Add(labelEntranceScore);
            panelModifyStudents.Controls.Add(labelFatherName);
            panelModifyStudents.Controls.Add(labelDateOfBirth);
            panelModifyStudents.Controls.Add(labelSurname);
            panelModifyStudents.Controls.Add(labelName);
            panelModifyStudents.Dock = System.Windows.Forms.DockStyle.Fill;
            panelModifyStudents.Location = new System.Drawing.Point(0, 0);
            panelModifyStudents.Name = "panelModifyStudents";
            panelModifyStudents.Size = new System.Drawing.Size(1168, 610);
            panelModifyStudents.TabIndex = 1;
            // 
            // comboBoxGroupName
            // 
            comboBoxGroupName.FormattingEnabled = true;
            comboBoxGroupName.Location = new System.Drawing.Point(16, 479);
            comboBoxGroupName.Name = "comboBoxGroupName";
            comboBoxGroupName.Size = new System.Drawing.Size(157, 23);
            comboBoxGroupName.TabIndex = 11;
            // 
            // labelGroup
            // 
            labelGroup.AutoSize = true;
            labelGroup.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGroup.Location = new System.Drawing.Point(16, 456);
            labelGroup.Name = "labelGroup";
            labelGroup.Size = new System.Drawing.Size(53, 20);
            labelGroup.TabIndex = 22;
            labelGroup.Text = "Group";
            // 
            // dataGridViewStudents
            // 
            dataGridViewStudents.AllowUserToResizeColumns = false;
            dataGridViewStudents.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridViewStudents.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewStudents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewStudents.Dock = System.Windows.Forms.DockStyle.Top;
            dataGridViewStudents.Location = new System.Drawing.Point(0, 0);
            dataGridViewStudents.Name = "dataGridViewStudents";
            dataGridViewStudents.RowHeadersWidth = 30;
            dataGridViewStudents.RowTemplate.Height = 25;
            dataGridViewStudents.Size = new System.Drawing.Size(1151, 230);
            dataGridViewStudents.TabIndex = 21;
            dataGridViewStudents.CellClick += dataGridViewStudents_CellClick;
            // 
            // comboBoxGender
            // 
            comboBoxGender.FormattingEnabled = true;
            comboBoxGender.Items.AddRange(new object[] { "Male", "Female" });
            comboBoxGender.Location = new System.Drawing.Point(241, 479);
            comboBoxGender.Name = "comboBoxGender";
            comboBoxGender.Size = new System.Drawing.Size(158, 23);
            comboBoxGender.TabIndex = 12;
            // 
            // buttonDelete
            // 
            buttonDelete.BackColor = System.Drawing.Color.Red;
            buttonDelete.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonDelete.ForeColor = System.Drawing.Color.White;
            buttonDelete.Location = new System.Drawing.Point(135, 641);
            buttonDelete.Name = "buttonDelete";
            buttonDelete.Size = new System.Drawing.Size(100, 37);
            buttonDelete.TabIndex = 18;
            buttonDelete.Text = "Delete";
            buttonDelete.UseVisualStyleBackColor = false;
            buttonDelete.Click += buttonDelete_Click;
            // 
            // buttonUpdate
            // 
            buttonUpdate.BackColor = System.Drawing.Color.FromArgb(0, 192, 0);
            buttonUpdate.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonUpdate.ForeColor = System.Drawing.Color.White;
            buttonUpdate.Location = new System.Drawing.Point(256, 641);
            buttonUpdate.Name = "buttonUpdate";
            buttonUpdate.Size = new System.Drawing.Size(100, 37);
            buttonUpdate.TabIndex = 19;
            buttonUpdate.Text = "Update";
            buttonUpdate.UseVisualStyleBackColor = false;
            buttonUpdate.Click += buttonUpdate_Click;
            // 
            // labelPhoneNumber
            // 
            labelPhoneNumber.AutoSize = true;
            labelPhoneNumber.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelPhoneNumber.Location = new System.Drawing.Point(463, 456);
            labelPhoneNumber.Name = "labelPhoneNumber";
            labelPhoneNumber.Size = new System.Drawing.Size(115, 20);
            labelPhoneNumber.TabIndex = 0;
            labelPhoneNumber.Text = "Phone Number";
            // 
            // labelGender
            // 
            labelGender.AutoSize = true;
            labelGender.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelGender.Location = new System.Drawing.Point(241, 456);
            labelGender.Name = "labelGender";
            labelGender.Size = new System.Drawing.Size(60, 20);
            labelGender.TabIndex = 0;
            labelGender.Text = "Gender";
            // 
            // labelEMail
            // 
            labelEMail.AutoSize = true;
            labelEMail.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelEMail.Location = new System.Drawing.Point(691, 456);
            labelEMail.Name = "labelEMail";
            labelEMail.Size = new System.Drawing.Size(53, 20);
            labelEMail.TabIndex = 0;
            labelEMail.Text = "E-Mail";
            // 
            // labelPassword
            // 
            labelPassword.AutoSize = true;
            labelPassword.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelPassword.Location = new System.Drawing.Point(241, 559);
            labelPassword.Name = "labelPassword";
            labelPassword.Size = new System.Drawing.Size(76, 20);
            labelPassword.TabIndex = 0;
            labelPassword.Text = "Password";
            // 
            // labelUsername
            // 
            labelUsername.AutoSize = true;
            labelUsername.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelUsername.Location = new System.Drawing.Point(16, 559);
            labelUsername.Name = "labelUsername";
            labelUsername.Size = new System.Drawing.Size(80, 20);
            labelUsername.TabIndex = 0;
            labelUsername.Text = "Username";
            // 
            // labelEducationDegree
            // 
            labelEducationDegree.AutoSize = true;
            labelEducationDegree.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelEducationDegree.Location = new System.Drawing.Point(241, 353);
            labelEducationDegree.Name = "labelEducationDegree";
            labelEducationDegree.Size = new System.Drawing.Size(132, 20);
            labelEducationDegree.TabIndex = 0;
            labelEducationDegree.Text = "Education Degree";
            // 
            // labelPaymentType
            // 
            labelPaymentType.AutoSize = true;
            labelPaymentType.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelPaymentType.Location = new System.Drawing.Point(16, 353);
            labelPaymentType.Name = "labelPaymentType";
            labelPaymentType.Size = new System.Drawing.Size(108, 20);
            labelPaymentType.TabIndex = 0;
            labelPaymentType.Text = "Payment Type";
            // 
            // labelEducationForm
            // 
            labelEducationForm.AutoSize = true;
            labelEducationForm.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelEducationForm.Location = new System.Drawing.Point(463, 353);
            labelEducationForm.Name = "labelEducationForm";
            labelEducationForm.Size = new System.Drawing.Size(119, 20);
            labelEducationForm.TabIndex = 0;
            labelEducationForm.Text = "Education Form";
            // 
            // labelDepartment
            // 
            labelDepartment.AutoSize = true;
            labelDepartment.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelDepartment.Location = new System.Drawing.Point(959, 353);
            labelDepartment.Name = "labelDepartment";
            labelDepartment.Size = new System.Drawing.Size(94, 20);
            labelDepartment.TabIndex = 0;
            labelDepartment.Text = "Department";
            // 
            // labelMajor
            // 
            labelMajor.AutoSize = true;
            labelMajor.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelMajor.Location = new System.Drawing.Point(691, 353);
            labelMajor.Name = "labelMajor";
            labelMajor.Size = new System.Drawing.Size(50, 20);
            labelMajor.TabIndex = 0;
            labelMajor.Text = "Major";
            // 
            // labelEntranceScore
            // 
            labelEntranceScore.AutoSize = true;
            labelEntranceScore.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelEntranceScore.Location = new System.Drawing.Point(959, 250);
            labelEntranceScore.Name = "labelEntranceScore";
            labelEntranceScore.Size = new System.Drawing.Size(112, 20);
            labelEntranceScore.TabIndex = 0;
            labelEntranceScore.Text = "Entrance Score";
            // 
            // labelFatherName
            // 
            labelFatherName.AutoSize = true;
            labelFatherName.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelFatherName.Location = new System.Drawing.Point(463, 250);
            labelFatherName.Name = "labelFatherName";
            labelFatherName.Size = new System.Drawing.Size(100, 20);
            labelFatherName.TabIndex = 0;
            labelFatherName.Text = "Father Name";
            // 
            // labelDateOfBirth
            // 
            labelDateOfBirth.AutoSize = true;
            labelDateOfBirth.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelDateOfBirth.Location = new System.Drawing.Point(691, 250);
            labelDateOfBirth.Name = "labelDateOfBirth";
            labelDateOfBirth.Size = new System.Drawing.Size(102, 20);
            labelDateOfBirth.TabIndex = 0;
            labelDateOfBirth.Text = "Date Of Birth";
            // 
            // labelSurname
            // 
            labelSurname.AutoSize = true;
            labelSurname.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelSurname.Location = new System.Drawing.Point(241, 250);
            labelSurname.Name = "labelSurname";
            labelSurname.Size = new System.Drawing.Size(71, 20);
            labelSurname.TabIndex = 0;
            labelSurname.Text = "Surname";
            // 
            // labelName
            // 
            labelName.AutoSize = true;
            labelName.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            labelName.Location = new System.Drawing.Point(15, 250);
            labelName.Name = "labelName";
            labelName.Size = new System.Drawing.Size(51, 20);
            labelName.TabIndex = 0;
            labelName.Text = "Name";
            // 
            // PageModifyStudent
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            Controls.Add(panelModifyStudents);
            Name = "PageModifyStudent";
            Size = new System.Drawing.Size(1168, 610);
            Load += PageModifyStudent_Load;
            panelModifyStudents.ResumeLayout(false);
            panelModifyStudents.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudents).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Button buttonClear;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.TextBox textBoxPassword;
        private System.Windows.Forms.TextBox textBoxPhoneNumber;
        private System.Windows.Forms.TextBox textBoxEMail;
        private System.Windows.Forms.TextBox textBoxUsername;
        private System.Windows.Forms.ComboBox comboBoxEducationDegree;
        private System.Windows.Forms.ComboBox comboBoxPaymentType;
        private System.Windows.Forms.ComboBox comboBoxEducationForm;
        private System.Windows.Forms.ComboBox comboBoxDepartment;
        private System.Windows.Forms.ComboBox comboBoxMajor;
        private System.Windows.Forms.TextBox textBoxEntranceScore;
        private System.Windows.Forms.TextBox textBoxFatherName;
        private System.Windows.Forms.DateTimePicker dateTimePickerDateOfBirth;
        private System.Windows.Forms.TextBox textBoxSurname;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Panel panelModifyStudents;
        private System.Windows.Forms.Label labelPhoneNumber;
        private System.Windows.Forms.Label labelGender;
        private System.Windows.Forms.Label labelEMail;
        private System.Windows.Forms.Label labelPassword;
        private System.Windows.Forms.Label labelUsername;
        private System.Windows.Forms.Label labelEducationDegree;
        private System.Windows.Forms.Label labelPaymentType;
        private System.Windows.Forms.Label labelEducationForm;
        private System.Windows.Forms.Label labelDepartment;
        private System.Windows.Forms.Label labelMajor;
        private System.Windows.Forms.Label labelEntranceScore;
        private System.Windows.Forms.Label labelFatherName;
        private System.Windows.Forms.Label labelDateOfBirth;
        private System.Windows.Forms.Label labelSurname;
        private System.Windows.Forms.Label labelName;
        private System.Windows.Forms.ComboBox comboBoxGender;
        private System.Windows.Forms.DataGridView dataGridViewStudents;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.ComboBox comboBoxGroupName;
        private System.Windows.Forms.Label labelGroup;
    }
}
