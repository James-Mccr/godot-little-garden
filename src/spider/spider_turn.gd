extends Turn

func turn():
	var spider = get_parent()
	if spider.shooting:
		spider.shoot_web()
	else:
		spider.detect_player()
	
