#############################################################################################################
#varriables
#varriables to be used for tpasting the result in the result text box
$draw = "It's a draw"
$youWin  = "You Won!!!"
$youLose = "You Lost :("

#initial score valus that will be updated as the player plays the game
$global:cpuScoreValue  = 0
$global:yourScoreValue = 0

#image location varriables unique to my computer
$global:imgLocation    = $global:beginningimg
$global:beginningimg   = (Get-Item 'C:\Users\%USERNAME$\Documents\WindowsPowerShell\rockPaperScisorsImages\beginning.jfif')
$global:winimg         = (Get-Item 'C:\Users\%USERNAME$\Documents\WindowsPowerShell\rockPaperScisorsImages\win.jpg')
$global:loseimg        = (Get-Item 'C:\Users\%USERNAME$\Documents\WindowsPowerShell\rockPaperScisorsImages\lose.jfif')
$global:drawimg        = (Get-Item 'C:\Users\%USERNAME$\Documents\WindowsPowerShell\rockPaperScisorsImages\draw.jfif')

#############################################################################################################
#functions
Function updateScore{                                           #this function is used to update the scoreboard while the player is playing
    if($result -eq $youLose){                                   #loop that runs if you lose the match
        $global:cpuScoreValue += 1                              #increases the cpu score varriable by 1
        $cpuScore.Text = $global:cpuScoreValue                  #updates the cpu score text box
        }
    if($result -eq $youWin){                                    #loop that runs if you win the match
        $global:yourScoreValue += 1                             #increases the your score varriable by 1
        $yourScore.Text = $global:yourScoreValue                #updates the cpu score text box
        }
    
    }

#this function is used when the "rock" button is pressed in the GUI
Function chooseRock {
    $yourPick = 1                                               #assigns the value of 1 to rock
    $cpuPick = get-random -Minimum 1 -Maximum 4                 #creates a random value 1-3 that indicates the cpu's choice 
    if ($cpuPick -eq 1){                                        #loop that runs if the cpu picks rock (1)
        $result                        = $draw                  #changes the result to draw in order to update the score
        $opponentChoice.Text           = "Rock"                 #puts the "Rock" string in the opponent choice text box
        $global:imgLocation            = $global:drawimg        #changes the image location to the location of the draw file
        $centerImagebox.imageLocation  = $global:imgLocation    #updates the image on the GUI
        }
    if ($cpuPick -eq 2){                                        #loop that runs if the cpu picks paper (2)
        $result                        = $youLose               #changes the result to win in order to update the score
        $opponentChoice.Text           = "Paper"                #puts the "Paper" string in the opponent choice text box
        $global:imgLocation            = $global:winimg         #changes the image location to the location of the win file
        $centerImagebox.imageLocation  = $global:imgLocation    #updates the image on the GUI
        }
    if ($cpuPick -eq 3){                                        #loop that runs if the cpu picks scisors (3)
        $result                        = $youWin                #changes the result to lose in order to update the score
        $opponentChoice.Text           = "Scisors"              #puts the "Scisors" string in the opponent choice text box
        $global:imgLocation            = $global:loseimg        #changes the image location to the location of the lose file
        $centerImagebox.imageLocation  = $global:imgLocation    #updates the image on the GUI
        }
    $yourChoice.Text = "Rock"                                   #puts the "Rock" string in the your choice text box
    $resultBox.Text  = $result                                  #puts the result string in the result text box
    updateScore                                                 #runs the update score function
    }

#this function is used when the "paper" button is pressed in the GUI
Function choosePaper {
    $yourPick = 2
    $cpuPick = get-random -Minimum 1 -Maximum 4
    if ($cpuPick -eq 2){
        $result                        = $draw
        $opponentChoice.Text           = "Paper"
        $global:imgLocation            = $global:drawimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    if ($cpuPick -eq 1){
        $result                        = $youWin
        $opponentChoice.text           = "Rock"
        $global:imgLocation            = $global:winimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    if ($cpuPick -eq 3){
        $result                        = $youLose
        $opponentChoice.text           = "Scisors"
        $global:imgLocation            = $global:loseimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    $yourChoice.text = "Paper"
    $resultBox.text  = $result
    updateScore
    }

#this function is used when the "scisorsk" button is pressed in the GUI
Function chooseScisors {
    $yourPick = 3
    $cpuPick = get-random -Minimum 1 -Maximum 4
    if ($cpuPick -eq 3){
        $result                        = $draw
        $opponentChoice.text           = "Scisors"
        $global:imgLocation            = $global:drawimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    if ($cpuPick -eq 2){
        $result                        = $youWin
        $opponentChoice.text           = "Paper"
        $global:imgLocation            = $global:winimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    if ($cpuPick -eq 1){
        $result                        = $youLose
        $opponentChoice.text           = "Rock"
        $global:imgLocation            = $global:loseimg
        $centerImagebox.imageLocation  = $global:imgLocation
        }
    $yourChoice.text = "Scisors"
    $resultBox.text  = $result
    updateScore
    }

#this function is used when the "reset" button is pressed in the GUI
Function Reset{
    $global:cpuScoreValue              = 0                          #sets the cpu score varriable to 0
    $cpuScore.Text                     = $global:cpuScoreValue      #updates the cpu score text box
    $global:yourScoreValue             = 0                          #sets the your score variable to 0
    $yourScore.Text                    = $global:yourScoreValue     #updates the your score text box
    $opponentChoice.text               = " "                        #sets the opponent choice text box to blank
    $yourChoice.text                   = " "                        #sets the your choice text box to blank
    $resultBox.text                    = " "                        #sets the result text box to blank
    $global:imgLocation                = $global:beginningimg       #sets the image to the beginning image
    $centerImagebox.imageLocation      = $global:imgLocation        #updates the image
    }
    
############################################################################################################
#diologue box
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#varriables to set the pixel width and height of the window itself 
$formWidth    = 600
$formHeight   = 400
$buttonWidth  = 100
$buttonHeight = 50

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point($formWidth,$formHeight)
$Form.text                       = "Form"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#b7d2e7")

$rock                            = New-Object system.Windows.Forms.Button
$rock.text                       = "Rock"
$rock.width                      = $buttonWidth
$rock.height                     = $buttonHeight
$rock.location                   = New-Object System.Drawing.Point(25,15)
$rock.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$rock.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#edeaea")
$rock.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#8b572a")

$Paper                           = New-Object system.Windows.Forms.Button
$Paper.text                      = "Paper"
$Paper.width                     = $buttonWidth
$Paper.height                    = $buttonHeight
$Paper.location                  = New-Object System.Drawing.Point(150,15)
$Paper.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$Paper.BackColor                 = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$scisors                         = New-Object system.Windows.Forms.Button
$scisors.text                    = "Scisors"
$scisors.width                   = $buttonWidth
$scisors.height                  = $buttonHeight
$scisors.location                = New-Object System.Drawing.Point(275,15)
$scisors.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$scisors.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#ef2a16")


$img                             =  [System.Drawing.Image]::Fromfile($global:imgLocation)
$centerImagebox                  = New-Object system.Windows.Forms.PictureBox
$centerImagebox.width            = 300
$centerImagebox.height           = 250
$centerImagebox.location         = New-Object System.Drawing.Point(25,75)
$centerImagebox.imageLocation    = $global:imgLocation
$centerImagebox.SizeMode         = [System.Windows.Forms.PictureBoxSizeMode]::zoom


$opponentChoiceLable             = New-Object system.Windows.Forms.TextBox
$opponentChoiceLable.multiline   = $false
$opponentChoiceLable.enabled     = $false
$opponentChoiceLable.width       = 150
$opponentChoiceLable.height      = 20
$opponentChoiceLable.Text        = "Opponent's Choice"
$opponentChoiceLable.location    = New-Object System.Drawing.Point(25,350)
$opponentChoiceLable.Font        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$opponentChoice                  = New-Object system.Windows.Forms.TextBox
$opponentChoice.multiline        = $false
$opponentChoice.enabled          = $false
$opponentChoice.width            = 150
$opponentChoice.height           = 20
$opponentChoice.location         = New-Object System.Drawing.Point(174,350)
$opponentChoice.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$yourChoiceLable                 = New-Object system.Windows.Forms.TextBox
$yourChoiceLable.multiline       = $false
$yourChoiceLable.enabled         = $false
$yourChoiceLable.width           = 150
$yourChoiceLable.height          = 20
$yourChoiceLable.Text            = "Your Choice"
$yourChoiceLable.location        = New-Object System.Drawing.Point(25,330)
$yourChoiceLable.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$yourChoice                      = New-Object system.Windows.Forms.TextBox
$yourChoice.multiline            = $false
$yourChoice.enabled              = $false
$yourChoice.width                = 150
$yourChoice.height               = 20
$yourChoice.location             = New-Object System.Drawing.Point(174,330)
$yourChoice.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$resultBoxLable                  = New-Object system.Windows.Forms.TextBox
$resultBoxLable.multiline        = $false
$resultBoxLable.enabled          = $false
$resultBoxLable.width            = 150
$resultBoxLable.height           = 20
$resultBoxLable.Text             = "Result"
$resultBoxLable.location         = New-Object System.Drawing.Point(25,370)
$resultBoxLable.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$resultBox                       = New-Object system.Windows.Forms.TextBox
$resultBox.multiline             = $false
$resultBox.enabled               = $false
$resultBox.width                 = 150
$resultBox.height                = 20
$resultBox.location              = New-Object System.Drawing.Point(174,370)
$resultBox.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$scoreWidth  = 120
$scoreHeight = 30

$cpuScore                        = New-Object system.Windows.Forms.TextBox
$cpuScore.multiline              = $false
$cpuScore.enabled                = $false
$cpuScore.width                  = $scoreWidth
$cpuScore.text                   = $cpuScoreValue
$cpuScore.location               = New-Object System.Drawing.Point(450,200)
$cpuScore.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',40)

$yourScore                       = New-Object system.Windows.Forms.TextBox
$yourScore.multiline             = $false
$yourScore.enabled               = $false
$yourScore.width                 = $scoreWidth
$yourScore.text                  = $yourScoreValue
$yourScore.location              = New-Object System.Drawing.Point(450,100)
$yourScore.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',40)

$opponentScoreLabel              = New-Object system.Windows.Forms.textBox
$opponentScoreLabel.multiline    = $false
$opponentScoreLabel.enabled      = $false
$opponentScoreLabel.width        = $scoreWidth
$opponentScoreLabel.height       = $scoreHeight
$opponentScoreLabel.text         = "Opponent's Score"
$opponentScoreLabel.location     = New-Object System.Drawing.Point(450,175)
$opponentScoreLabel.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$yourScoreLabel                  = New-Object system.Windows.Forms.TextBox
$yourScoreLabel.multiline        = $false
$yourScoreLabel.enabled          = $false
$yourScoreLabel.width            = $scoreWidth
$yourScoreLabel.height           = $scoreHeight
$yourScoreLabel.text             = "Your Score"
$yourScoreLabel.location         = New-Object System.Drawing.Point(450,75)
$yourScoreLabel.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$resetButton                     = New-Object system.Windows.Forms.Button
$resetButton.text                = "Reset"
$resetButton.width               = $scoreWidth
$resetButton.height              = 60
$resetButton.location            = New-Object System.Drawing.Point(450,330)
$resetButton.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$resetButton.BackColor           = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

#includes all the parst of the GUI on the form
$Form.controls.AddRange(@($rock,$Paper,$scisors,$opposingChoice,$resultBox, $cpuScore, 
$yourScore, $opponentScoreLabel, $yourScoreLabel, $resultBoxLable, $opponentChoice, 
$opponentChoiceLable, $yourChoice, $yourChoiceLable, $ResetButton, $centerImagebox))

$rock.Add_Click({ chooseRock })             #executes the rock funciton when the rock button is clicked
$scisors.Add_Click({ chooseScisors })       #executes the scisors function when the scisors button is clicked
$Paper.Add_Click({ choosePaper})            #executes the paper function when the paper function is clicked
$ResetButton.Add_Click({ Reset })           #executes the reset funciton when the reset button is clicked

$form.ShowDialog()                          #sidplays the window created to the screen

