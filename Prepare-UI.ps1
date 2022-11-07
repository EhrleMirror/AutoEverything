[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

#Create Form Object
$objForm = New-Object System.Windows.Forms.Form
$objForm.Backcolor="white" #set Background color white
$objForm.StartPosition = "CenterScreen" #Set start position to Center of the screen
$objForm.Size = New-Object System.Drawing.Size(800,500) #Set Window size (check later)
$objForm.Text = "Customize Windows install"
##--END Window Settings--


#Create Laber for Button1 (Choose Applications)
$appsLabel = New-Object System.Windows.Forms.Label
$appsLabel.Location = New-Object System.Drawing.Size(10,20) 
$appsLabel.Size = New-Object System.Drawing.Size(280,20) 
$appsLabel.Font = [System.Drawing.Font]::new("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Bold) #Bold Font
$appsLabel.Text = "Choose Applications you want to install"
$objForm.Controls.Add($appsLabel) 

$AppsButton = New-Object System.Windows.Forms.Button
$AppsButton.Location = New-Object System.Drawing.Point(299,15)
$AppsButton.Size = New-Object System.Drawing.Size(100,30)
$AppsButton.Text = 'Applications'
$AppsButton.Add_Click({ $objForm.ShowDialog()})
      
####################################################################
#######################   Apps Form   ##############################
####################################################################

  
# Import Windows Forms Assembly
Add-Type -AssemblyName System.Windows.Forms;
# Create a Form
$Form = New-Object -TypeName System.Windows.Forms.Form;
# Create a CheckedListBox
$CheckedListBox = New-Object -TypeName System.Windows.Forms.CheckedListBox;
# Add the CheckedListBox to the Form
$Form.Controls.Add($CheckedListBox);
# Widen the CheckedListBox
$CheckedListBox.Width = 350;
$CheckedListBox.Height = 200;
# Add 10 items to the CheckedListBox
$CheckedListBox.Items.AddRange(1..10);

# Clear all existing selections
$CheckedListBox.ClearSelected();
# Define a list of items we want to be checked
$MyArray = 1,2,5,8,9;

# For each item that we want to be checked ...
foreach ($Item in $MyArray) {
    # Check it ...
    $CheckedListBox.SetItemChecked($CheckedListBox.Items.IndexOf($Item), $true);
}
$objform.AcceptButton = $AppsButton
$objform.Controls.Add($AppsButton)

####################################################################
#####################   End Apps Form   ############################
####################################################################





If ($objCitrixUserCheckbox.Checked)
  {
    #Install
  } 
If ($objNonCitrixUserCheckbox.Checked) 
  {
    #Not install
  }


#Form Object end
[void] $objForm.ShowDialog()