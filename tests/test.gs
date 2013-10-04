/* Genie for posixvala test */

struct StructName
	a : string
	i : int

enum MyEnum
	FirstValue = 1
	ThirdValue = 3

delegate DelegateType (a : int) : bool
def f1 (a:int) : bool
	print "testing delegate value %d", a
	return true
                
def f2 (d:DelegateType, a:int)
	var c = d (a)
	print "c = %d",c?1:0

def fn_no_null (param : string) : string
	return param  

// main
init
	f2 (f1, 5)

	var mystruct = StructName() {
		a="foo",
		i=33
	}
	print "Hello World %d", mystruct.i

	for var I = 1 to 10
		print "looping" 
