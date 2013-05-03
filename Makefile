CXX = g++

CXXFLAGS =  -framework OpenGL -framework GLUT -lGLEW -w 

INC=-I/Users/rajadityamukherjee/Programs/Research_Code/Marching_Cube/includes

clean :
	rm -rf opengl.o 

build :
	$(CXX) InitShader.cpp main.cpp $(INC) $(CXXFLAGS)-o opengl.o 

run :
	./opengl.o

all : clean build run

build_dbg :
	$(CXX) InitShader.cpp main.cpp $(INC) $(CXXFLAGS)-o opengl.o -g

run_dbg :
	gdb opengl.o

dbg : clean build_dbg run_dbg
