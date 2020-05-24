extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
    _ready()
	pass # Replace with function body.

# (optional) class definition with a custom icon
class_name MyClass, "res://path/to/optional/icon.svg"

var a = 5
var s = "Hello"
var arr = [1, 2, 3]
var dict = {"key": "value", 2: 3}
var typed_var: int
var inferred_type := "String"


const ANSWER = 42
const THE_NAME = "Charly"

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

func some_function(param1, param2):
    var local_var = 5

    if param1 < local_var:
        print(param1)
    elif param2 > 5:
        print(param2)
    else:
        print("Fail!")

    for i in range(20):
        print(i)

    while param2 != 0:
        param2 -= 1

    var local_var2 = param1 + 3
    return local_var2


# Functions override functions with the same name on the base/parent class.
# If you still want to call them, use '.' (like 'super' in other languages).

func something(p1, p2):
    .something(p1, p2)


# Inner class

class Something:
    var a = 10


# Constructor

func _init():
    print("Constructed!")
    var lv = Something.new()
    print(lv.a)


var arr = []
arr = [1, 2, 3]
var b = arr[1] # This is 2.
var c = arr[arr.size() - 1] # This is 3.
var d = arr[-1] # Same as the previous line, but shorter.
arr[0] = "Hi!" # Replacing value 1 with "Hi!".
arr.append(4) # Array is now ["Hi!", 2, 3, 4].

var d = {4: 5, "A key": "A value", 28: [1, 2, 3]}
d["Hi!"] = 0
d = {
    22: "value",
    "some_key": 2,
    "other_key": [2, 3, 4],
    "more_key": "Hello"
}

var d = {
    test22 = "value",
    some_key = 2,
    other_key = [2, 3, 4],
    more_key = "Hello"
}

var d = {} # Create an empty Dictionary.
d.waiting = 14 # Add String "waiting" as a key and assign the value 14 to it.
d[4] = "hello" # Add integer 4 as a key and assign the String "hello" as its value.
d["Godot"] = 3.01 # Add String "Godot" as a key and assign the value 3.01 to it.

var test = 4
# Prints "hello" by indexing the dictionary with a dynamic key.
# This is not the same as `d.test`. The bracket syntax equivalent to
# `d.test` is `d["test"]`.
print(d[test])

var a # Data type is 'null' by default.
var b = 5
var c = 3.8
var d = b + c # Variables are always initialized in order.

var my_vector2: Vector2
var my_node: Node = Sprite.new()

var my_vector2 := Vector2() # 'my_vector2' is of type 'Vector2'.
var my_node := Sprite.new() # 'my_node' is of type 'Sprite'.

var my_node2D: Node2D
my_node2D = $Sprite as Node2D # Works since Sprite is a subtype of Node2D.

var my_node2D: Node2D
my_node2D = $Button as Node2D # Results in 'null' since a Button is not a subtype of Node2D.

var my_int: int
my_int = "123" as int # The string can be converted to int.
my_int = Vector2() as int # A Vector2 can't be converted to int, this will cause an error.

# Will infer the variable to be of type Sprite.
var my_sprite := $Character as Sprite

# Will fail if $AnimPlayer is not an AnimationPlayer, even if it has the method 'play()'.
($AnimPlayer as AnimationPlayer).play("walk")

const A = 5
const B = Vector2(20, 20)
const C = 10 + 20 # Constant expression.
const D = Vector2(20, 30).x # Constant expression: 20.
const E = [1, 2, 3, 4][0] # Constant expression: 1.
const F = sin(20) # 'sin()' can be used in constant expressions.
const G = x + 20 # Invalid; this is not a constant expression!
const H = A + 20 # Constant expression: 25.

const A: int = 5
const B: Vector2 = Vector2()

enum {TILE_BRICK, TILE_FLOOR, TILE_SPIKE, TILE_TELEPORT}
# Is the same as:
const TILE_BRICK = 0
const TILE_FLOOR = 1
const TILE_SPIKE = 2
const TILE_TELEPORT = 3

enum State {STATE_IDLE, STATE_JUMP = 5, STATE_SHOOT}
# Is the same as:
const State = {STATE_IDLE = 0, STATE_JUMP = 5, STATE_SHOOT = 6}
# Access values with State.STATE_IDLE, etc.

func my_function(a, b):
    print(a)
    print(b)
    return a + b  # Return is optional; without it 'null' is returned.

func my_function(a: int, b: String):
    pass

func my_function(int_arg := 42, String_arg := "string"):
    pass

func my_int_function() -> int:
    return 0

void_function() -> void:
    return # Can't return a value

# Call a function by name in one step.
my_node.call("my_function", args)

# Store a function reference.
var my_func = funcref(my_node, "my_function")
# Call stored function reference.
my_func.call_func(args)

static func sum2(a, b):
    return a + b

if [expression]:
    statement(s)
elif [expression]:
    statement(s)
else:
    statement(

if 1 + 1 == 2: return 2 + 2
else:
    var x = 3 + 3
    return x

var x = [value] if [expression] else [value]
y += 3 if y < 10 else -1

while [expression]:
    statement(s)

for x in [5, 7, 11]:
    statement # Loop iterates 3 times with 'x' as 5, then 7 and finally 11.

var dict = {"a": 0, "b": 1, "c": 2}
for i in dict:
    print(dict[i]) # Prints 0, then 1, then 2.

for i in range(3):
    statement # Similar to [0, 1, 2] but does not allocate an array.

for i in range(1, 3):
    statement # Similar to [1, 2] but does not allocate an array.

for i in range(2, 8, 2):
    statement # Similar to [2, 4, 6] but does not allocate an array.

for c in "Hello":
    print(c) # Iterate through all characters in a String, print every letter on new line.

for i in 3:
    statement # Similar to range(3)

for i in 2.2:
    statement # Similar to range(ceil(2.2))

match [expression]:
    [pattern](s):
        [block]
    [pattern](s):
        [block]
    [pattern](s):
        [block]

match x:
    1:
        print("We are number one!")
    2:
        print("Two are better than one!")
    "test":
        print("Oh snap! It's a string!")

match typeof(x):
    TYPE_REAL:
        print("float")
    TYPE_STRING:
        print("text")
    TYPE_ARRAY:
        print("array")

    1:
        print("It's one!")
    2:
        print("It's one times two!")
    _:
        print("It's not 1 or 2. I don't care to be honest.")

match x:
    1:
        print("It's one!")
    2:
        print("It's one times two!")
    var new_var:
        print("It's not 1 or 2, it's ", new_var)

match x:
    []:
        print("Empty array")
    [1, 3, "test", null]:
        print("Very specific array")
    [var start, _, "test"]:
        print("First element is ", start, ", and the last is \"test\"")
    [42, ..]:
        print("Open ended array")

match x:
    {}:
        print("Empty dict")
    {"name": "Dennis"}:
        print("The name is Dennis")
    {"name": "Dennis", "age": var age}:
        print("Dennis is ", age, " years old.")
    {"name", "age"}:
        print("Has a name and an age, but it's not Dennis :(")
    {"key": "godotisawesome", ..}:
        print("I only checked for one entry and ignored the rest")

match x:
    1, 2, 3:
        print("It's 1 - 3")
    "Sword", "Splash potion", "Fist":
        print("Yep, you've taken damage")

# Inherit from 'Character.gd'.

extends "res://path/to/character.gd"

# Load character.gd and create a new node instance from it.

var Character = load("res://path/to/character.gd")
var character_node = Character.new()

# Item.gd

extends Node
class_name Item, "res://interface/icons/item.png"

# Saved as a file named 'character.gd'.

class_name Character


var health = 5


func print_health():
    print(health)


func print_this_script_three_times():
    print(get_script())
    print(ResourceLoader.load("res://character.gd"))
    print(Character)

# Inherit/extend a globally available class.
extends SomeClass

# Inherit/extend a named class file.
extends "somefile.gd"

# Inherit/extend an inner class in another file.
extends "somefile.gd".SomeInnerClass

# Cache the enemy class.
const Enemy = preload("enemy.gd")

# [...]

# Use 'is' to check inheritance.
if entity is Enemy:
    entity.apply_damage()

.base_func(args)

func some_func(x):
    .some_func(x) # Calls the same function on the parent class.

func _init(args).(parent_args):
   pass

# State.gd (inherited class)
var entity = null
var message = null


func _init(e=null):
    entity = e


func enter(m):
    message = m


# Idle.gd (inheriting class)
extends "State.gd"


func _init(e=null, m=null).(e):
    # Do something with 'e'.
    message = m

# Idle.gd

func _init().(5):
    pass

# Inside a class file.

# An inner class in this class file.
class SomeInnerClass:
    var a = 5


    func print_value_of_a():
        print(a)


# This is the constructor of the class file's main class.
func _init():
    var c = SomeInnerClass.new()
    c.print_value_of_a()

# Load the class resource when calling load().
var my_class = load("myclass.gd")

# Preload the class only once at compile time.
const MyClass = preload("myclass.gd")


func _init():
    var a = MyClass.new()
    a.some_function()

var variable = value setget setterfunc, getterfunc

var my_var setget my_var_set, my_var_get


func my_var_set(new_value):
    my_var = new_value


func my_var_get():
    return my_var # Getter must return a value.

# Only a setter.
var my_var = 5 setget my_var_set
# Only a getter (note the comma).
var my_var = 5 setget ,my_var_get

func _init():
    # Does not trigger setter/getter.
    my_integer = 5
    print(my_integer)

    # Does trigger setter/getter.
    self.my_integer = 5
    print(self.my_integer)

tool
extends Button


func _ready():
    print("Hello")

extends Node


# A signal named health_depleted.
signal health_depleted

# Game.gd

func _ready():
    var character_node = get_node('Character')
    character_node.connect("health_depleted", self, "_on_Character_health_depleted")


func _on_Character_health_depleted():
    get_tree().reload_current_scene()

# Character.gd


signal health_changed


func take_damage(amount):
    var old_health = health
    health -= amount

    # We emit the health_changed signal every time the
    # character takes damage.
    emit_signal("health_changed", old_health, health)

# Lifebar.gd

# Here, we define a function to use as a callback when the
# character's health_changed signal is emitted.


func _on_Character_health_changed(old_value, new_value):
    if old_value > new_value:
        progress_bar.modulate = Color.red
    else:
        progress_bar.modulate = Color.green

    # Imagine that `animate` is a user-defined function that animates the
    # bar filling up or emptying itself.
    progress_bar.animate(old_value, new_value)

# Game.gd

func _ready():
    var character_node = get_node('Character')
    var lifebar_node = get_node('UserInterface/Lifebar')

    character_node.connect("health_changed", lifebar_node, "_on_Character_health_changed")

# Defining a signal that forwards two arguments.
signal health_changed(old_value, new_value)

# Game.gd

func _ready():
    var character_node = get_node('Character')
    var battle_log_node = get_node('UserInterface/BattleLog')

    character_node.connect("health_changed", battle_log_node, "_on_Character_health_changed", [character_node.name])

# BattleLog.gd

func _on_Character_health_changed(old_value, new_value, character_name):
    if not new_value <= old_value:
        return

    var damage = old_value - new_value
    label.text += character_name + " took " + str(damage) + " damage."

func my_func():
    print("Hello")
    yield()
    print("world")


func _ready():
    var y = my_func()
    # Function state saved in 'y'.
    print("my dear")
    y.resume()
    # 'y' resumed and is now an invalid state.

func my_func():
    print("Hello")
    print(yield())
    return "cheers!"


func _ready():
    var y = my_func()
    # Function state saved in 'y'.
    print(y.resume("world"))
    # 'y' resumed and is now an invalid state.

func co_func():
    for i in range(1, 5):
        print("Turn %d" % i)
        yield();


func _ready():
    var co = co_func();
    while co is GDScriptFunctionState && co.is_valid():
        co = co.resume();

# Resume execution the next frame.
yield(get_tree(), "idle_frame")

# Resume execution when animation is done playing.
yield(get_node("AnimationPlayer"), "animation_finished")

# Wait 5 seconds, then resume execution.
yield(get_tree().create_timer(5.0), "timeout")

func my_func():
    yield(button_func(), "completed")
    print("All buttons were pressed, hurray!")


func button_func():
    yield($Button0, "pressed")
    yield($Button1, "pressed")

# Wait for when any node is added to the scene tree.
var node = yield(get_tree(), "node_added")

    var result = rand_range(-1.0, 1.0)

    if result < 0.0:
        yield(get_tree(), "idle_frame")

    return result


func make():
    var result = generate()

    if result is GDScriptFunctionState: # Still working.
        result = yield(result, "completed")

    return result

var my_label


func _ready():
    my_label = get_node("MyLabel")

onready var my_label = get_node("MyLabel")

# Check that 'i' is 0. If 'i' is not 0, an assertion error will occur.
assert(i == 0)

# If the exported value assigns a constant or constant expression,
# the type will be inferred and used in the editor.

export var number = 5

# Export can take a basic data type as an argument, which will be
# used in the editor.

export(int) var number

# Export can also take a resource type to use as a hint.

export(Texture) var character_face
export(PackedScene) var scene_file
# There are many resource types that can be used this way, try e.g.
# the following to list them:
export(Resource) var resource

# Integers and strings hint enumerated values.

# Editor will enumerate as 0, 1 and 2.
export(int, "Warrior", "Magician", "Thief") var character_class
# Editor will enumerate with string names.
export(String, "Rebecca", "Mary", "Leah") var character_name

# Named enum values

# Editor will enumerate as THING_1, THING_2, ANOTHER_THING.
enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
export(NamedEnum) var x

# Strings as paths

# String is a path to a file.
export(String, FILE) var f
# String is a path to a directory.
export(String, DIR) var f
# String is a path to a file, custom filter provided as hint.
export(String, FILE, "*.txt") var f

# Using paths in the global filesystem is also possible,
# but only in scripts in "tool" mode.

# String is a path to a PNG file in the global filesystem.
export(String, FILE, GLOBAL, "*.png") var tool_image
# String is a path to a directory in the global filesystem.
export(String, DIR, GLOBAL) var tool_dir

# The MULTILINE setting tells the editor to show a large input
# field for editing over multiple lines.
export(String, MULTILINE) var text

# Limiting editor input ranges

# Allow integer values from 0 to 20.
export(int, 20) var i
# Allow integer values from -10 to 20.
export(int, -10, 20) var j
# Allow floats from -10 to 20 and snap the value to multiples of 0.2.
export(float, -10, 20, 0.2) var k
# Allow values 'y = exp(x)' where 'y' varies between 100 and 1000
# while snapping to steps of 20. The editor will present a
# slider for easily editing the value.
export(float, EXP, 100, 1000, 20) var l

# Floats with easing hint

# Display a visual representation of the 'ease()' function
# when editing.
export(float, EASE) var transition_speed

# Colors

# Color given as red-green-blue value (alpha will always be 1).
export(Color, RGB) var col
# Color given as red-green-blue-alpha value.
export(Color, RGBA) var col

# Nodes

# Another node in the scene can be exported as a NodePath.
export(NodePath) var node_path
# Do take note that the node itself isn't being exported -
# there is one more step to call the true node:
var node = get_node(node_path)

# Resources

export(Resource) var resource
# In the Inspector, you can then drag and drop a resource file
# from the FileSystem dock into the variable slot.

# Opening the inspector dropdown may result in an
# extremely long list of possible classes to create, however.
# Therefore, if you specify an extension of Resource such as:
export(AnimationNode) var resource
# The drop-down menu will be limited to AnimationNode and all
# its inherited classes.

func _get_property_list():
    var properties = []
    properties.append({
            name = "Rotate",
            type = TYPE_NIL,
            hint_string = "rotate_",
            usage = PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE
    })
    return properties

extends Node
# Hierarchical State machine for the player.
# Initializes states and delegates engine callbacks
# (_physics_process, _unhandled_input) to the state.


signal state_changed(previous, new)

export var initial_state = NodePath()
var is_active = true setget set_is_active

onready var _state = get_node(initial_state) setget set_state
onready var _state_name = _state.name


func _init():
    add_to_group("state_machine")


func _ready():
    connect("state_changed", self, "_on_state_changed")
    _state.enter()


func _unhandled_input(event):
    _state.unhandled_input(event)


func _physics_process(delta):
    _state.physics_process(delta)


func transition_to(target_state_path, msg={}):
    if not has_node(target_state_path):
        return

    var target_state = get_node(target_state_path)
    assert(target_state.is_composite == false)

    _state.exit()
    self._state = target_state
    _state.enter(msg)
    Events.emit_signal("player_state_changed", _state.name)


func set_is_active(value):
    is_active = value
    set_physics_process(value)
    set_process_unhandled_input(value)
    set_block_signals(not value)


func set_state(value):
    _state = value
    _state_name = _state.name


func _on_state_changed(previous, new):
    print("state changed")
    emit_signal("state_changed")

enum Tiles {
    TILE_BRICK,
    TILE_FLOOR,
    TILE_SPIKE,
    TILE_TELEPORT,
}

func heal(amount: int) -> void:
	pass

var health = 56
print("Remaining health: %d%%" % health)
# Output: "Remaining health: 56%"

