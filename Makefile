imgui_lua_bindings.o: imgui_lua_bindings.cpp imgui_iterator.h
	g++ -c imgui_lua_bindings.cpp -I../imgui -I/usr/include/lua5.4 -fpermissive -DENABLE_IM_LUA_END_STACK

imgui_iterator.h: generate_imgui_bindings.pl ../imgui/imgui.h
	./generate_imgui_bindings.pl <../imgui/imgui.h >imgui_iterator.h

all:
	g++ -c -I.. -I../imgui -I../lua/src imgui_lua_bindings.cpp -o imgui_lua_bindings.o

