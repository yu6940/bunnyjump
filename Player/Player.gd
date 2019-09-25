extends KinematicBody2D

var motion = Vector2(0,0)
 
export var GRAVITY = 60
export var SPEED = 500
export var JUMP = 700
export var jump_count = 0 #ค่าเริ่มต้น
func _physics_process(delta): #ทำงานเมื่อมีระบบฟิสิกส์
	apply_GRAVITY()
	JUMP()
	WATK()
	
	move_and_slide(motion, Vector2(0,-1)) 
	
func apply_GRAVITY():
	if is_on_floor():#ยืนบนfloorและเป็นการให้กดค้างแล้วกระโดดทั้งเดียว ไม่บินขึ้น
		print("I'm floor")
	else:
		motion.y += GRAVITY #(แบบย่อ) motion.y = motion.y + GRAVITY(ตัวเต็ม) 
	
func WATK():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x = 0
		
func JUMP():
	if is_on_floor(): #เป็นการทำให้กระโดดได้มากกว่า 1 ครั้ง
	
		if Input.is_action_just_pressed("jump"): 
			motion.y = -JUMP
			
	
	#else:
		#motion.y = 700 #ไม่จำเป็นต้องใสelse่ เพราะมีmotion.yข้างบนแล้ว
	
	