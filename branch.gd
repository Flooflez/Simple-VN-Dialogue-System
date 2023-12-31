class_name Branch

extends  Node

var text: String
var choices: Array
var nextNodes: Array
var end: bool
	
func getChoiceText(index: int) -> String:
	return choices[index]

func getNextNode(index: int) -> Branch:
	return nextNodes[index]
