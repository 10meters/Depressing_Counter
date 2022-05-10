extends Node2D

var voter_popu= 42202597
var bbm_popu=28564900
var leni_popu=13637697

var voter_n = 0
var bbm_sample=0
var leni_sample=0

var rng = RandomNumberGenerator.new() #the stuff that actually deals with the problem

var seed_ 
var stops =[42, 50, 63,90, 100] #what percentage of voter_n/voter_popu to log data at

func _ready():
	if SEED.sseed == "":
		var sed = (hash(OS.get_time()))
		rng.seed= sed
		SEED.text= str("seed: ",sed)
	else:
		rng.seed = hash(SEED.sseed)


func _physics_process(delta):
	for i in stops: #not important, just deals with displaying the text, ik i should have put this in a separate function but lmao
		if (((voter_n)/(voter_popu))*100)>= i:
			match i:
				42:
					$HBoxContainer/VBoxContainer3/TIME2.text=str((((voter_n)/(voter_popu))*100))
					$HBoxContainer/VBoxContainer/L2.text=str(leni_sample)
					$HBoxContainer/VBoxContainer2/B2.text=str(bbm_sample)
				50:
					$HBoxContainer/VBoxContainer3/TIME3.text=str((((voter_n)/(voter_popu))*100))
					$HBoxContainer/VBoxContainer/L3.text=str(leni_sample)
					$HBoxContainer/VBoxContainer2/B3.text=str(bbm_sample)
				63:
					$HBoxContainer/VBoxContainer3/TIME4.text=str((((voter_n)/(voter_popu))*100))
					$HBoxContainer/VBoxContainer/L4.text=str(leni_sample)
					$HBoxContainer/VBoxContainer2/B4.text=str(bbm_sample)
				90:
					$HBoxContainer/VBoxContainer3/TIME5.text=str((((voter_n)/(voter_popu))*100))
					$HBoxContainer/VBoxContainer/L4.text=str(leni_sample)
					$HBoxContainer/VBoxContainer2/B4.text=str(bbm_sample)
				100:
					$HBoxContainer/VBoxContainer3/TIME6.text=str((((voter_n)/(voter_popu))*100))
					$HBoxContainer/VBoxContainer/L4.text=str(leni_sample)
					$HBoxContainer/VBoxContainer2/B4.text=str(bbm_sample)
	
	var selector = rng.randi_range(1, voter_popu-(voter_n))
	if selector <= (bbm_popu-bbm_sample):
		bbm_sample +=1
	else:
		leni_sample +=1
	voter_n+=1
	
	selector = rng.randi_range(1, voter_popu-(voter_n))
	if selector <= (bbm_popu-bbm_sample):
		bbm_sample +=1
	else:
		leni_sample +=1
	voter_n+=1
	selector = rng.randi_range(1, voter_popu-(voter_n))
	if selector <= (bbm_popu-bbm_sample):
		bbm_sample +=1
	else:
		leni_sample +=1
	voter_n+=1
	
	selector = rng.randi_range(1, voter_popu-(voter_n))
	if selector <= (bbm_popu-bbm_sample):
		bbm_sample +=1
	else:
		leni_sample +=1
	voter_n+=1
	selector = rng.randi_range(1, voter_popu-(voter_n))
	if selector <= (bbm_popu-bbm_sample):
		bbm_sample +=1
	else:
		leni_sample +=1
	voter_n+=1
	
	$n.text= str("n = ", voter_n)
	$percent.text= str("% = ", ((voter_n)/(voter_popu))*100)
	
	$bbm.text= str("bbm = ", bbm_sample)
	$leni.text= str("leni = ", leni_sample)
	if bbm_sample !=0:
		$bbm_leni.text= str("% = ", (float(leni_sample)/float(bbm_sample))*100)