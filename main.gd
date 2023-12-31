extends Node

var dialogue1 = Branch.new()
var dialogue2 = Branch.new()
var dialogue3 = Branch.new()
var dialogue4 = Branch.new()
var dialogue5 = Branch.new()
var dialogue6 = Branch.new()
var dialogue7 = Branch.new()
var dialogue8 = Branch.new()

var current_dialogue

@onready var npc_label = $MarginContainer/VBoxContainer/Label
@onready var choice1 = $MarginContainer/VBoxContainer/Button
@onready var choice2 = $MarginContainer/VBoxContainer/Button2

@onready var container = $MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue1.text = "Hello! I am a dialogue thing"
	dialogue1.choices = ["Wowzers!", "I hate you!"]
	dialogue1.nextNodes = [dialogue2, dialogue3]
	dialogue1.end = false

	dialogue2.text = "Yeah! It's cool right?"
	dialogue2.choices = ["For sure!", "I change my mind!"]
	dialogue2.nextNodes = [dialogue4, dialogue3]
	dialogue2.end = false
	
	dialogue3.text = "No need to be rude!"
	dialogue3.choices = ["You loser", "I am sorry"]
	dialogue3.nextNodes = [dialogue5, dialogue6]
	dialogue3.end = false
	
	dialogue5.text = "Wow, thanks a lot. You ruined my day"
	dialogue5.choices = ["Goodbye"]
	dialogue5.nextNodes = []
	dialogue5.end = true
	
	dialogue6.text = "Thanks for apologising, it means a lot to me"
	dialogue6.choices = ["You're welcome, goodbye!"]
	dialogue6.nextNodes = []
	dialogue6.end = true
	
	dialogue4.text = "You can say anything you want!"
	dialogue4.choices = ["Babooey! Badaboom!", "Meep morp shlorp"]
	dialogue4.nextNodes = [dialogue7, dialogue8]
	dialogue4.end = false
	
	dialogue7.text = "Very cool! Babooey to you too!"
	dialogue7.choices = ["Babooey-bu-bye!"]
	dialogue7.nextNodes = []
	dialogue7.end = true

	dialogue8.text = "Meemermeebeepmorp! Wonderful!"
	dialogue8.choices = ["Meep-beep-bye!"]
	dialogue8.nextNodes = []
	dialogue8.end = true
	
	load_dialogue(dialogue1)


func load_dialogue(dialogue):
	current_dialogue = dialogue
	npc_label.text = current_dialogue.text
	choice1.text = current_dialogue.choices[0]
	if current_dialogue.choices.size() > 1:
		choice2.text = current_dialogue.choices[1]
		choice2.visible = true
	else:
		choice2.visible = false
	


func _on_button_pressed(): #choice 1
	if current_dialogue.end:
		container.visible = false
	else:
		load_dialogue(current_dialogue.nextNodes[0])


func _on_button_2_pressed(): #choice 2
	load_dialogue(current_dialogue.nextNodes[1])
