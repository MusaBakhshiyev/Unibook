namespace Unibook.UnibookTeacher
{
    partial class PageModifyParticipation
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
            buttonBack = new System.Windows.Forms.Button();
            buttonNext = new System.Windows.Forms.Button();
            dataGridViewParticipates = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).BeginInit();
            SuspendLayout();
            // 
            // buttonBack
            // 
            buttonBack.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonBack.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonBack.Location = new System.Drawing.Point(201, 47);
            buttonBack.Name = "buttonBack";
            buttonBack.Size = new System.Drawing.Size(76, 31);
            buttonBack.TabIndex = 51;
            buttonBack.Text = "Back";
            buttonBack.UseVisualStyleBackColor = false;
            buttonBack.Click += buttonBack_Click;
            // 
            // buttonNext
            // 
            buttonNext.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            buttonNext.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            buttonNext.Location = new System.Drawing.Point(1089, 47);
            buttonNext.Name = "buttonNext";
            buttonNext.Size = new System.Drawing.Size(76, 31);
            buttonNext.TabIndex = 52;
            buttonNext.Text = "Next";
            buttonNext.UseVisualStyleBackColor = false;
            buttonNext.Click += buttonNext_Click;
            // 
            // dataGridViewParticipates
            // 
            dataGridViewParticipates.AllowUserToAddRows = false;
            dataGridViewParticipates.AllowUserToDeleteRows = false;
            dataGridViewParticipates.AllowUserToResizeColumns = false;
            dataGridViewParticipates.AllowUserToResizeRows = false;
            dataGridViewParticipates.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewParticipates.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewParticipates.Location = new System.Drawing.Point(201, 84);
            dataGridViewParticipates.Name = "dataGridViewParticipates";
            dataGridViewParticipates.RowHeadersVisible = false;
            dataGridViewParticipates.RowTemplate.Height = 30;
            dataGridViewParticipates.Size = new System.Drawing.Size(964, 301);
            dataGridViewParticipates.TabIndex = 42;
            dataGridViewParticipates.CellClick += dataGridViewParticipates_CellClick;
            dataGridViewParticipates.CellEndEdit += dataGridViewParticipates_CellEndEdit;
            // 
            // PageModifyParticipation
            // 
            AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            AutoScroll = true;
            BackColor = System.Drawing.Color.Lavender;
            Controls.Add(buttonBack);
            Controls.Add(buttonNext);
            Controls.Add(dataGridViewParticipates);
            Name = "PageModifyParticipation";
            Size = new System.Drawing.Size(1366, 432);
            ((System.ComponentModel.ISupportInitialize)dataGridViewParticipates).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonNext;
        private System.Windows.Forms.DataGridView dataGridViewParticipates;
    }
}
